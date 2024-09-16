
echo starting now seed 27;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_50 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_100 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 4 --clpairs 100 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_500 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 4 --clpairs 500 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_1000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 4 --clpairs 1000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_0_rs_5000 --clusteringalgo graphconstrained --kclusters 50 --chameleon_mode 4 --clpairs 5000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

cg_rs_5000 --clusteringalgo restricted_kmeans --kclusters 50 --chameleon_mode 3 --clpairs 5000 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;


#Checkm2

python3 checkm2/bin/checkm2 database --download

python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_50/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_50/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_100/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_100/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_500/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_500/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_1000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_1000/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_5000/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_5000/graphmb_results -x .fa --force;



# outputs

python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_50/graphmb_results/quality_report.tsv "Constrained Graph Kmeans ML 50 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_100/graphmb_results/quality_report.tsv "Constrained Graph Kmeans ML 100 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_500/graphmb_results/quality_report.tsv "Constrained Graph Kmeans ML 500 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_1000/graphmb_results/quality_report.tsv "Constrained Graph Kmeans ML 1000 pairs 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_5000/graphmb_results/quality_report.tsv "Constrained Graph Kmeans ML 5000 pairs 27";
