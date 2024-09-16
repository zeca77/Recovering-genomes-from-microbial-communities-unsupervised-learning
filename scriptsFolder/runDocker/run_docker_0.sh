#!/bin/bash
echo starting now seed 0;
docker rm graphmb_checkm2;
docker pull zeca77/graphmb_checkm2:latest;
docker run --name graphmb_checkm2 --rm -v $(pwd)/graphmb/scriptsFolder/:/graphmb_checkm2/scriptsFolder zeca77/graphmb_checkm2:latest bash -c "chmod +x scriptsFolder/runningscripts/run_strong_100_0.sh && scriptsFolder/runningscripts/run_strong_100_0.sh"
docker cp graphmb_checkm2:/graphmb_checkm2/results.csv graphmb/results_0.csv;
echo Process done. Sleeping..... seed 0;