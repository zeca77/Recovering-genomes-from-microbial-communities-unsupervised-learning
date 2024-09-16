python3 checkm2/bin/checkm2 database --download

#kmeans

graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo kmeans --kclusters 200 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster_writeembs --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "kmeans 200";


graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo kmeans --kclusters 100 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "kmeans 400";



graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo kmeans --kclusters 600 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "kmeans 600";

#gmm
graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo gmm --kclusters 200 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "gmm 200";

graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo gmm --kclusters 400 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "gmm 400";

graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo gmm --kclusters 600 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "gmm 600";

#kmeansconstr
graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo graphconstrained --kclusters 200 --chameleon_mode 2 --clpairs 1000 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "graphconstrained 200";

graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo graphconstrained --kclusters 400 --chameleon_mode 2 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "graphconstrained 400";

graphmb --seed 0 --outdir results/strong100/bins/graphmb --clusteringalgo graphconstrained --kclusters 600 --chameleon_mode 2 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "graphconstrained 600";
