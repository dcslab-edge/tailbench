#!/bin/bash

DATA_ROOT=/ssd/tailbench/tailbench.inputs
NSERVERS=1
WARMUPREQS=1000
REQUESTS=3000
SERVER_PORT=7313

TBENCH_NCLIENTS=1 TBENCH_SERVER=0.0.0.0 TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_MAXREQS=${REQUESTS} TBENCH_WARMUPREQS=${WARMUPREQS} \
    ./xapian_networked_server -n ${NSERVERS} -d ${DATA_ROOT}/xapian/wiki \
    -r 1000000000 &
echo $! > server.pid

sleep 5 # Wait for server to come up
