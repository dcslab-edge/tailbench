#!/bin/bash
SPHINX_HOME=/ssd/tailbench/tailbench-v0.9/sphinx
DATA_ROOT=/ssd/tailbench/tailbench.inputs
SERVER_PORT=7312
THREADS=2
WARMUP=100
MAXREQS=1000
#WARMUP_TIME=10
WARMUP_TIME=5
#MEASURE_TIME=8
MEASURE_TIME=55


TBENCH_WARMUPTIME=${WARMUP_TIME} TBENCH_MEASURETIME=${MEASURE_TIME} TBENCH_NCLIENTS=1 TBENCH_SERVER=0.0.0.0 TBENCH_SERVER_PORT=${SERVER_PORT} LD_LIBRARY_PATH=${SPHINX_HOME}/sphinx-install/lib:${LD_LIBRARY_PATH} \
    TBENCH_MAXREQS=${MAXREQS} TBENCH_WARMUPREQS=${WARMUP} \
    ${SPHINX_HOME}/decoder_server_networked -t ${THREADS}

echo $! > server.pid

sleep 1
