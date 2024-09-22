echo vamb 

#kmeans

echo vamb;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo vamb --kclusters 200 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster_writeembs --markers marker_gene_stats.tsv --assembly data/aale/;

graphmb --seed 6 --outdir results/strong100/bins/graphmb --clusteringalgo vamb --kclusters 600 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
echo vamb;
