import pickle

import numpy as np
import datetime
import os
import tensorflow as tf
import random
import logging
from tqdm import tqdm
import mlflow
from graphmb.models import  TH
from graphmb.utils import set_seed # , run_tsne, plot_embs, plot_edges_sim
from graphmb.train_ccvae import prepare_data_for_gnn
from graphmb.visualize import plot_edges_sim
from graphmb.evaluate import compute_clusters_and_stats, eval_epoch
from graphmb.utils import get_cluster_mask
from graphmb.gnn_models import name_to_model


def run_model_gnn(dataset, args, logger, nrun, target_metric):
    set_seed(args.seed)
    node_names = np.array(dataset.node_names)
    RESULT_EVERY = args.evalepochs
    hidden_gnn = args.hidden_gnn
    output_dim_gnn = args.embsize_gnn
    epochs = args.epoch
    lr_gnn = args.lr_gnn
    nlayers_gnn = args.layers_gnn
    gname = args.model_name
    gmodel_type = name_to_model[gname.split("_")[0].upper()]
    clustering = args.clusteringalgo
    k = args.kclusters
    use_disconnected = not args.quick
    cluster_markers_only = args.quick
    use_edge_weights = True
    concat_features = True # bypass args, otherwise results are bad
    
    with mlflow.start_run(run_name=args.assembly.split("/")[-1] + "-" + args.outname):
        mlflow.log_params(vars(args))
        current_time = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
        tf.config.run_functions_eagerly(True)

        X, adj, cluster_mask, neg_pair_idx, pos_pair_idx = prepare_data_for_gnn(
                dataset, use_edge_weights, cluster_markers_only, use_raw=args.rawfeatures,
                binarize=args.binarize, remove_edges=args.noedges)
        if nrun == 0:
            print("logging to mlflow")
            logger.info("******* Running model: {} **********".format(gname))
            logger.info("***** using edge weights: {} ******".format(use_edge_weights))
            logger.info("***** using disconnected: {} ******".format(use_disconnected))
            logger.info("***** concat features: {} *****".format(concat_features))
            logger.info("***** cluster markers only: {} *****".format(cluster_markers_only))
            logger.info("***** threshold adj matrix: {} *****".format(args.binarize))
            logger.info("***** self edges only: {} *****".format(args.noedges))
            logger.info("***** Using raw kmer+abund features: {}".format(args.rawfeatures))
        
            logger.info("***** SCG neg pairs: {}".format(neg_pair_idx.shape))
            logger.info("***** input features dimension: {}".format(X[cluster_mask].shape[1]))
            logger.info("***** Nodes used for clustering: {}".format(X[cluster_mask].shape[0]))

        #plot edges vs initial embs
        #id_to_scg = {i: set(dataset.contig_markers.get(node_name, {}).keys()) for i, node_name in enumerate(dataset.node_names)}
        #plot_edges_sim(X, dataset.adj_matrix, id_to_scg, f"{args.outdir}/{args.outname}_pretrain_")

        # pre train clustering
        if not args.skip_preclustering and nrun == 0:
            cluster_labels, stats, _, hq_bins = compute_clusters_and_stats(
                        X[cluster_mask], node_names[cluster_mask],
                        dataset, clustering=clustering, k=k,
                        amber=(args.labels is not None and "amber" in args.labels),
                        cuda=args.cuda,
                    )
            logger.info(f">>> Pre train stats: {str(stats)}")
        else:
            stats = {"hq": 0, "epoch":0, target_metric: 0}
        
        scores = [stats]
        losses = {"total": [], "ae": [], "gnn": [], "scg": []}
        X = X.astype(np.float32)
        features = tf.constant(X)
        input_dim_gnn = X.shape[1]
    
        logger.info(f"*** Model input dim {X.shape[1]}, GNN input dim {input_dim_gnn}")

        gnn_model = gmodel_type(
            features_shape=features.shape,
            input_dim=input_dim_gnn,
            labels=None,
            adj=adj,
            embsize=output_dim_gnn,
            hidden_units=hidden_gnn,
            layers=nlayers_gnn,
            conv_last=False,
        )
        logger.info(f"*** output clustering dim {output_dim_gnn}")

        th = TH(
            features,
            gnn_model=gnn_model,
            lr=lr_gnn,
            all_different_idx=neg_pair_idx,
            all_same_idx=pos_pair_idx,
            ae_encoder=None,
            ae_decoder=None,
            latentdim=output_dim_gnn,
            graph_weight=float(args.graph_alpha),
            ae_weight=float(args.ae_alpha),
            scg_weight=float(args.scg_alpha),
            num_negatives=args.negatives,
            decoder_input=args.decoder_input,
        )

        #gnn_model.summary()
        if args.eval_split == 0:
            train_idx = np.arange(len(features))
            eval_idx = []
        else:
            train_idx = np.array(random.sample(list(range(len(features))), int(len(features)*(1-args.eval_split))))
            eval_idx = np.array([x for x in np.arange(len(features)) if x not in train_idx])
            logging.info(f"**** using {len(train_idx)} for training and {len(eval_idx)} for eval")
        features = np.array(features)
        pbar_epoch = tqdm(range(epochs), disable=args.quiet, position=0)
        scores = []
        best_embs = None
        best_model = th.gnn_model.get_weights()
        best_score = 0
        best_epoch = 0
        batch_size = args.batchsize
        scores_string = ""
        if batch_size == 0:
            batch_size = len(train_idx)
        all_cluster_labels = []
        step = 0
        for e in pbar_epoch:
            np.random.shuffle(train_idx)
            step += 1
            loss, gnn_losses, ae_losses = th.train_unsupervised(train_idx, scg=True)
            epoch_losses = {"Total": loss.numpy(),
                            "gnn": gnn_losses["gnn_loss"].numpy(),
                             "SCG": gnn_losses["scg_loss"].numpy(),
                             #"pred": gnn_losses["pred_loss"],
                            #'GNN  LR': float(trainer.opt._decayed_lr(float)),
                            "pos": gnn_losses["pos"].numpy(),
                            "neg": gnn_losses["neg"].numpy()}
            mlflow.log_metrics(epoch_losses, step=step)
            gnn_loss = epoch_losses["gnn"]
            diff_loss = epoch_losses["SCG"]

            if args.eval_split > 0:
                eval_total_loss, eval_gnn_loss, eval_diff_loss, eval_pos_loss, \
                    eval_neg_loss = th.train_unsupervised(eval_idx, training=False)
                eval_epoch_losses = {"Eval gnn loss": float(eval_gnn_loss), "Eval SCG loss": float(eval_diff_loss),
                                     "Eval GNN loss": float(eval_total_loss),
                                     "Eval pos loss": float(eval_pos_loss),
                                     "Eval neg_loss": float(eval_neg_loss)}
                mlflow.log_metrics(eval_epoch_losses, step=step)
            #else:
            #    eval_loss, eval_mse1, eval_mse2, eval_kld = 0, 0, 0, 0

            gpu_mem_alloc = tf.config.experimental.get_memory_info('GPU:0')["peak"] / 1000000 if args.cuda else 0
            #gpu_mem_alloc = tf.config.experimental.get_memory_usage('GPU:0') / 1000000 if args.cuda else 0
            if (e + 1) % RESULT_EVERY == 0 and e > args.evalskip and target_metric != "noeval":
                gnn_input_features = features
                node_new_features = th.gnn_model(gnn_input_features, None, training=False)
                node_new_features = node_new_features.numpy()
                if concat_features:
                    node_new_features = tf.concat([gnn_input_features, node_new_features], axis=1).numpy()
                eval_output = eval_epoch(node_new_features, cluster_mask, th.gnn_model.get_weights(),
                                         args, dataset, e, scores, best_score, best_embs, best_epoch,
                                         best_model, target_metric=target_metric)
                
                best_score, best_embs, best_epoch, scores, best_model, cluster_labels = eval_output
                stats = scores[-1]
                if args.quiet:
                    logger.info(f"--- EPOCH {e:d} ---")
                    scores_string = f"HQ={stats['hq']}   Best{target_metric}={round(best_score, 3)} Best Epoch={best_epoch}"
                    logger.info(f"[{gname} {nlayers_gnn}l] L={gnn_loss:.3f} D={diff_loss:.3f} {scores_string} GPU={gpu_mem_alloc:.1f}MB")
                    logger.info(str(stats))
                mlflow.log_metrics(stats, step=step)
                all_cluster_labels.append(cluster_labels)
                scores_string = f"HQ={stats['hq']}  Best{target_metric}={round(best_score, 3)}  Best Epoch={best_epoch}"
            pbar_epoch.set_description(
                f"[{args.outname} {nlayers_gnn}l] L={gnn_loss:.3f} D={diff_loss:.3f} {scores_string} GPU={gpu_mem_alloc:.1f}MB"
            )
            total_loss = gnn_loss + diff_loss
            losses["gnn"].append(gnn_loss)
            losses["scg"].append(diff_loss)
            losses["total"].append(total_loss)

        gnn_model.set_weights(best_model)
        node_new_features = th.gnn_model(features, None, training=False)
        node_new_features = node_new_features.numpy()
        if best_embs is None or target_metric != "noeval":
            best_embs = node_new_features
        if concat_features:
            node_new_features = tf.concat([features, node_new_features], axis=1).numpy()
        cluster_labels, stats, _, _ = compute_clusters_and_stats(
            node_new_features, node_names, dataset,
            clustering=clustering, k=k, amber=(args.labels is not None and "amber" in args.labels),
            cuda=args.cuda,
        )
        all_cluster_labels.append(cluster_labels)
        stats["epoch"] = e
        scores.append(stats)
        if target_metric != "noeval":
            # get best stats:
            target_scores = [s[target_metric] for s in scores]
            best_idx = np.argmax(target_scores)
        else:
            best_embs = node_new_features
            best_idx = -1
        mlflow.log_metrics(scores[best_idx], step=step+1)
    logger.info(f">>> best epoch all contigs: {RESULT_EVERY + (best_idx*RESULT_EVERY)} : {stats} <<<")
    logger.info(f">>> best epoch: {RESULT_EVERY + (best_idx*RESULT_EVERY)} : {scores[best_idx]} <<<")

    # Define the data structure
    data = {
        "version": "0.9.0",
        "sample_id": "SAMPLEID",
        "best_train_embs": {
            node_names[i]: all_cluster_labels[best_idx][i] for i in range(len(all_cluster_labels[best_idx]))
        },
        "metrics":  scores[best_idx],
        "contig_labels": all_cluster_labels[best_idx]

    }

    # Define the file path
    file_path = f"{args.outdir}/{args.outname}_{nrun}_best_contig2bin.pkl"

    with open(file_path, "w") as f:
        for i in range(len(all_cluster_labels[best_idx])):
            f.write(f"{node_names[i]}\t{all_cluster_labels[best_idx][i]}\n")
    #plot edges vs final embs
    #plot_edges_sim(best_embs, dataset.adj_matrix, id_to_scg, f"{args.outdir}/{args.outname}_posttrain_")
    return best_embs, scores[best_idx], all_cluster_labels[best_idx]

