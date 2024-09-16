#!/bin/bash
echo starting now seed 77;
docker rm graphmb_checkm2
docker pull zeca77/graphmb_checkm2:latest
docker run --name graphmb_checkm2 --rm -v $(pwd)/graphmb/scriptsFolder/:/graphmb_checkm2/scriptsFolder zeca77/graphmb_checkm2:latest bash -c "chmod +x scriptsFolder/runningscripts/100clusters/run_strong_100_77.sh && scriptsFolder/runningscripts/100clusters/run_strong_100_77.sh"
docker cp graphmb_checkm2:/graphmb_checkm2/results.csv graphmb/resultsFiles/results_77.csv;
echo Process done. Sleeping..... seed 77;