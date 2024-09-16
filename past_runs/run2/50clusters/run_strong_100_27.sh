#Running Graphmb

echo starting now seed 27;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_50 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 2 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_100 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 2 --clpairs 100 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_500 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 2 --clpairs 500 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_1000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 2 --clpairs 1000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_5000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 2 --clpairs 5000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_scg_rs_50 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 3 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_scg_rs_100 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 3 --clpairs 100 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_scg_rs_500 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 3 --clpairs 500 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_scg_rs_1000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 3 --clpairs 1000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_scg_rs_5000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 3 --clpairs 5000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;


graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_topk_10 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 0 --clpairs 27 --usek 10 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_topk_50 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 0 --clpairs 27 --usek 50 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_topk_100 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 0 --clpairs 27 --usek 100 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_topk_500 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 0 --clpairs 27 --usek 500 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_topk_1000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 0 --clpairs 27 --usek 1000 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_topk_5000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 0 --clpairs 27 --usek 5000 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

#Checkm2


python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_50/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_50/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_100/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_100/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_500/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_500/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_1000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_1000/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_5000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_5000/graphmb_results -x .fa --force;



python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg_rs_50/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg_rs_50/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg_rs_100/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg_rs_100/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg_rs_500/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg_rs_500/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg_rs_1000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg_rs_1000/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg_rs_5000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg_rs_5000/graphmb_results -x .fa --force;

python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_topk_10/graphmb_bins --output-directory results/strong100/constrainedgraph_0_topk_10/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_topk_50/graphmb_bins --output-directory results/strong100/constrainedgraph_0_topk_50/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_topk_100/graphmb_bins --output-directory results/strong100/constrainedgraph_0_topk_100/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_topk_500/graphmb_bins --output-directory results/strong100/constrainedgraph_0_topk_500/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_topk_1000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_topk_1000/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_topk_5000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_topk_5000/graphmb_results -x .fa --force;


# outputs

python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_50/graphmb_results/quality_report.tsv "Constrained Graph Random sampling 50 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_100/graphmb_results/quality_report.tsv "Constrained Graph Random sampling 100 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_500/graphmb_results/quality_report.tsv "Constrained Graph Random sampling 500 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_1000/graphmb_results/quality_report.tsv "Constrained Graph Random sampling 1000 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_5000/graphmb_results/quality_report.tsv "Constrained Graph Random sampling 5000 pairs 27";

python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg_rs_50/graphmb_results/quality_report.tsv "Constrained Graph Random sampling scg 50 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg_rs_100/graphmb_results/quality_report.tsv "Constrained Graph Random sampling scg 100 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg_rs_500/graphmb_results/quality_report.tsv "Constrained Graph Random sampling scg 500 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg_rs_1000/graphmb_results/quality_report.tsv "Constrained Graph Random sampling scg 1000 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg_rs_5000/graphmb_results/quality_report.tsv "Constrained Graph Random sampling scg 5000 pairs 27";

python3 checkm2_inputs.py results/strong100/constrainedgraph_0_topk_10/graphmb_results/quality_report.tsv "Constrained Graph ml topk 10 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_topk_50/graphmb_results/quality_report.tsv "Constrained Graph ml topk 50 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_topk_100/graphmb_results/quality_report.tsv "Constrained Graph ml topk 100 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_topk_500/graphmb_results/quality_report.tsv "Constrained Graph ml topk 500 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_topk_1000/graphmb_results/quality_report.tsv "Constrained Graph ml topk 1000 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_topk_5000/graphmb_results/quality_report.tsv "Constrained Graph ml topk 5000 pairs 27";


echo sleeping now;
sleep 40000;

