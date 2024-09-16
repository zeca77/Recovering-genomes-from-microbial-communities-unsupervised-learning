python3 checkm2/bin/checkm2 database --download

#kmeans

graphmb --seed 27 --outdir results/strong100/bins/graphmb --clusteringalgo kmeansconstr --kclusters 200 --chameleon_mode 4 --clpairs 500 --usek 0 --post writebins_cluster_writeembs --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "kmeansconstr 200";


graphmb --seed 27 --outdir results/strong100/bins/graphmb --clusteringalgo kmeansconstr --kclusters 400 --chameleon_mode 4 --clpairs 500 --usek 0 --post writebins_cluster_writeembs --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "kmeansconstr 400";


graphmb --seed 27 --outdir results/strong100/bins/graphmb --clusteringalgo kmeansconstr --kclusters 600 --chameleon_mode 4 --clpairs 500 --usek 0 --post writebins_cluster_writeembs --markers marker_gene_stats.tsv --assembly data/aale/;
python3 checkm2/bin/checkm2 predict --threads 30 --input results/strong100/bins/graphmb/graphmb_bins --output-directory results/strong100/graphmb/graphmb_results -x .fa --force;
python3 checkm2_inputs.py results/strong100/graphmb/graphmb_results/quality_report.tsv "kmeansconstr 600";


echo finishing seed 27 aale 

sleep 100000