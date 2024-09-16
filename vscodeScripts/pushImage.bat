docker build --pull --rm -f "Dockerfile" -t graphmb_checkm2 "." 
docker tag graphmb_checkm2 zeca77/graphmb_checkm2:latest
docker login
docker push zeca77/graphmb_checkm2:latest