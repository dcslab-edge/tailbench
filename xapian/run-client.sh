#!/bin/bash

DATA_ROOT=/ssd2/tailbench/tailbench.inputs
SERVER_PORT=7313
#QPS=500
QPS=100
THREADS=1
RAND_SEED=0
MINSLEEPNS=100000


#TBENCH_SERVER=147.46.242.201 TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_CLIENT_THREADS=${THREADS} TBENCH_QPS=${QPS} TBENCH_RANDSEED=${RAND_SEED} TBENCH_MINSLEEPNS=${MINSLEEPNS} \
TBENCH_SERVER=147.46.242.201 TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_CLIENT_THREADS=${THREADS} TBENCH_QPS=${QPS} TBENCH_RANDSEED=${RAND_SEED} TBENCH_MINSLEEPNS=${MINSLEEPNS} \
    TBENCH_TERMS_FILE=${DATA_ROOT}/xapian/terms.in \
    ./xapian_networked_client &

echo $! > client.pid
