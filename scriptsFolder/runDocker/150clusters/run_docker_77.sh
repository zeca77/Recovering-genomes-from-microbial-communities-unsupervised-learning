#!/bin/bash
echo starting now seed 77;

docker pull zeca77/graphmb_checkm2:latest
docker rm graphmb_checkm2;
docker run --rm -v $(pwd)/graphmb/scriptsFolder/:/graphmb_checkm2/scriptsFolder zeca77/graphmb_checkm2:latest bash -c "chmod +x scriptsFolder/runningscripts/150clusters/run_strong_100_77.sh && scriptsFolder/runningscripts/150clusters/run_strong_100_77.sh"
docker cp graphmb_checkm2:/graphmb_checkm2/results.csv graphmb/resultsFiles/results_77.csv;
echo Process done. Sleeping..... seed 77;