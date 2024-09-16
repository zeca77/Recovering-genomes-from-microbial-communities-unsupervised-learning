#Running Graphmb with seed 0, respectively, kmeans and vamb

echo starting now seed 77  100 clusters;
python3 checkm2/bin/checkm2 database --download

#Running with seed 77
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_norestrict --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 0 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_scg --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 1 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_rs --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 2 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_rs_scg --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 3 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_norestrict_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 0 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_scg_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 1 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_rs_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 2 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 77 --outdir results/strong100/bins/constrainedgraph_77_rs_scg_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 3 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_77.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

#Checkm2 for seed 77python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_norestrict/graphmb_bins --output-directory results/strong100/constrainedgraph_77_norestrict/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_scg/graphmb_bins --output-directory results/strong100/constrainedgraph_77_scg/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_rs/graphmb_bins --output-directory results/strong100/constrainedgraph_77_rs/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_rs_scg/graphmb_bins --output-directory results/strong100/constrainedgraph_77_rs_scg/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_norestrict_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_77_norestrict_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_scg_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_77_scg_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_rs_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_77_rs_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_77_rs_scg_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_77_rs_scg_usek/graphmb_results -x .fa --force;

# Seed 77 results
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_norestrict/graphmb_results/quality_report.tsv "Constrained Graph 77";
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_scg/graphmb_results/quality_report.tsv "Constrained Graph SCG 77";
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_rs/graphmb_results/quality_report.tsv "Constrained Graph Sampling 77";
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_rs_scg/graphmb_results/quality_report.tsv "Constrained Graph Sampling SCG 77";
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_norestrict_usek/graphmb_results/quality_report.tsv "Constrained Graph UseK 77";
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_scg_usek/graphmb_results/quality_report.tsv "Constrained Graph SCG UseK 77";
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_rs_usek/graphmb_results/quality_report.tsv "Constrained Graph Sampling UseK 77"
python3 checkm2_inputs.py results/strong100/constrainedgraph_77_rs_scg_usek/graphmb_results/quality_report.tsv "Constrained Graph Sampling SCG UseK 77";

echo sleeping now;

#Running Graphmb with seed 0, respectively, kmeans and vamb

echo starting now seed 27  100 clusters;

#Running with seed 27graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_norestrict --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 0 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_scg --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 1 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_rs --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 2 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_rs_scg --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 3 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_norestrict_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 0 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_scg_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 1 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_rs_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 2 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 27 --outdir results/strong100/bins/constrainedgraph_27_rs_scg_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 3 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs_27.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

#Checkm2 for seed 27
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_norestrict/graphmb_bins --output-directory results/strong100/constrainedgraph_27_norestrict/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_scg/graphmb_bins --output-directory results/strong100/constrainedgraph_27_scg/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_rs/graphmb_bins --output-directory results/strong100/constrainedgraph_27_rs/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_rs_scg/graphmb_bins --output-directory results/strong100/constrainedgraph_27_rs_scg/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_norestrict_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_27_norestrict_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_scg_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_27_scg_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_rs_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_27_rs_usek/graphmb_results -x .fa --force;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/constrainedgraph_27_rs_scg_usek/graphmb_bins --output-directory results/strong100/constrainedgraph_27_rs_scg_usek/graphmb_results -x .fa --force;

# Seed 27 results
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_norestrict/graphmb_results/quality_report.tsv "Constrained Graph 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_scg/graphmb_results/quality_report.tsv "Constrained Graph SCG 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_rs/graphmb_results/quality_report.tsv "Constrained Graph Sampling 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_rs_scg/graphmb_results/quality_report.tsv "Constrained Graph Sampling SCG 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_norestrict_usek/graphmb_results/quality_report.tsv "Constrained Graph UseK 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_scg_usek/graphmb_results/quality_report.tsv "Constrained Graph SCG UseK 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_rs_usek/graphmb_results/quality_report.tsv "Constrained Graph Sampling UseK 27";
python3 checkm2_inputs.py results/strong100/constrainedgraph_27_rs_scg_usek/graphmb_results/quality_report.tsv "Constrained Graph Sampling SCG UseK 27";

echo sleeping now;

#Running Graphmb with seed 0, respectively, kmeans and vamb

echo starting now seed 0  100 clusters;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_norestrict --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 0 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_scg --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 1 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 2 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs_scg --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 3 --usek 0 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_norestrict_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 0 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_scg_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 1 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 2 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;
graphmb --seed 0 --outdir results/strong100/bins/constrainedgraph_0_rs_scg_usek --clusteringalgo graphconstrained --kclusters 100 --chameleon_mode 3 --usek 1 --post writebins_cluster --embs results/strong100/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/strong100/;

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

sleep 180000