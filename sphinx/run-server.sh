#!/bin/bash

DATA_ROOT=/ssd2/tailbench/tailbench.inputs
SERVER_PORT=7313
THREADS=1
AUDIO_SAMPLES='audio_samples'
WARMUP=10
MAXREQS=10

TBENCH_NCLIENTS=1 TBENCH_SERVER=0.0.0.0 TBENCH_SERVER_PORT=${SERVER_PORT} LD_LIBRARY_PATH=./sphinx-install/lib:${LD_LIBRARY_PATH} \
    TBENCH_MAXREQS=${MAXREQS} TBENCH_WARMUPREQS=${WARMUP} \
    ./decoder_server_networked -t $THREADS &

echo $! > server.pid

sleep 2
