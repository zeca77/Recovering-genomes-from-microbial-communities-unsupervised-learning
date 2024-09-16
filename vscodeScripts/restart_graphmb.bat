docker stop graphmb_checkm2
docker rm graphmb_checkm2
docker run --name graphmb_checkm2 --gpus=all --pull missing -t -i -v source=myvol,target=/graphmb_checkm2 graphmb_checkm2 bash
