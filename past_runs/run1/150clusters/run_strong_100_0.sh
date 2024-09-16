#Running Graphmb with seed 0, respectively, kmeans and vamb

echo starting now seed 0  150 clusters;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_norestrict --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 0 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_scg --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 1 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 2 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs_scg --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 3 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_norestrict_usek --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 0 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_scg_usek --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 1 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs_usek --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 2 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs_scg_usek --clusteringalgo graphconstrained --kclusters 150 --chameleon_mode 3 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

#Checkm2 for seed 0
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_norestrict/graphmb_bins --output-directory results/strong100/constrainedgraph_0_norestrict/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_scg/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_scg/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_norestrict_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_0_norestrict_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_scg_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_0_scg_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_0_rs_scg_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_0_rs_scg_usek/graphmb_results -x .fa --force;

# Seed 0 results
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_norestrict/graphmb_results/quality_report.tsv "Constrained Graph 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg/graphmb_results/quality_report.tsv "Constrained Graph SCG 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs/graphmb_results/quality_report.tsv "Constrained Graph Sampling 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_scg/graphmb_results/quality_report.tsv "Constrained Graph Sampling SCG 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_norestrict_usek/graphmb_results/quality_report.tsv "Constrained Graph UseK 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_scg_usek/graphmb_results/quality_report.tsv "Constrained Graph SCG UseK 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_usek/graphmb_results/quality_report.tsv "Constrained Graph Sampling UseK 0";
python3 checkm2_inputs.py results/strong100/constrainedgraph_0_rs_scg_usek/graphmb_results/quality_report.tsv "Constrained Graph Sampling SCG UseK 0";

echo sleeping now;

