#!/bin/bash

#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#source ${DIR}/../configs.sh

DATA_ROOT=/ssd/tailbench/tailbench.inputs

#source /ssd/tailbench/tailbench-v0.9/configs.sh
THREADS=2
REQS=100000000 # Set this very high; the harness controls maxreqs

#TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=50000 TBENCH_QPS=500 \
TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=30000 TBENCH_QPS=500 TBENCH_RANDSEED=1 \
    TBENCH_MINSLEEPNS=10000 TBENCH_MNIST_DIR=${DATA_ROOT}/img-dnn/mnist \
    /ssd/tailbench/tailbench-v0.9/img-dnn/img-dnn_integrated -r ${THREADS} \
    -f ${DATA_ROOT}/img-dnn/models/model.xml -n ${REQS}
