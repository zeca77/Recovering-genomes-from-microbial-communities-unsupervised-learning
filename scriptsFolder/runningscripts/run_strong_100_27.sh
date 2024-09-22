echo seed 4

#kmeans

echo kmeans;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo kmeans --kclusters 200 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster_writeembs --markers marker_gene_stats.tsv --assembly data/aale/;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo kmeans --kclusters 100 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;


graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo kmeans --kclusters 600 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
echo gmm;

#gmm
graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo gmm --kclusters 200 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo gmm --kclusters 400 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo gmm --kclusters 600 --chameleon_mode 4 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;

#kmeansconstr
echo graphconstrained;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo graphconstrained --kclusters 200 --chameleon_mode 2 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo graphconstrained --kclusters 400 --chameleon_mode 2 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;

graphmb --seed 4 --outdir results/strong100/bins/graphmb --clusteringalgo graphconstrained --kclusters 600 --chameleon_mode 2 --clpairs 50 --usek 0 --post writebins_cluster --embs results/strong100/bins/graphmb/graphmb_best_embs.pickle --markers marker_gene_stats.tsv --assembly data/aale/;
