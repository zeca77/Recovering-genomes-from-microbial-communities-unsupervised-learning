#!/bin/bash
echo starting now seed 27;

docker pull zeca77/graphmb_checkm2:latest
docker run --rm -v $(pwd)/graphmb/scriptsFolder/:/graphmb_checkm2/scriptsFolder zeca77/graphmb_checkm2:latest bash -c "chmod +x scriptsFolder/runningscripts/150clusters/run_strong_100_27.sh && scriptsFolder/runningscripts/150clusters/run_strong_100_27.sh"
docker cp graphmb_checkm2:/graphmb_checkm2/results.csv graphmb/results_27.csv;
echo Process done. Sleeping..... seed 27;