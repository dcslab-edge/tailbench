#!/bin/bash

if [[ -z "${NTHREADS}" ]]; then NTHREADS=1; fi

QPS=1000
MAXREQS=3000
WARMUPREQS=14000
SERVER_PORT=7315

TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_SERVER=0.0.0.0 TBENCH_NCLIENTS=1 TBENCH_MAXREQS=${MAXREQS} TBENCH_WARMUPREQS=${WARMUPREQS} 
chrt -r 99 \
    ./mttest_server_networked -j${NTHREADS} mycsba masstree &
echo $! > server.pid

echo ${TBENCH_SERVER_PORT}
sleep 5 # Allow server to come up

TBENCH_QPS=${QPS} TBENCH_MINSLEEPNS=10000 chrt -r 99 ./mttest_client_networked &
echo $! > client.pid

wait $(cat client.pid)

# Clean up
./kill_networked.sh
    
