#!/bin/bash
echo starting now;
docker rm graphmb_checkm2;
docker pull zeca77/graphmb_checkm2:latest;
docker run --rm --name graphmb_checkm2  -v $(pwd)/graphmb/scriptsFolder/:/graphmb_checkm2/scriptsFolder zeca77/graphmb_checkm2:latest bash -c "chmod +x scriptsFolder/runningscripts/50clusters/run_strong_100.sh && scriptsFolder/runningscripts/50clusters/run_strong_100.sh"
docker cp graphmb_checkm2:/graphmb_checkm2/results.csv graphmb/results_50.csv;
echo Process done. Sleeping.....;