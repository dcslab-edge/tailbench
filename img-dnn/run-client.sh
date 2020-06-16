#!/bin/bash

DATA_ROOT=/ssd2/tailbench/tailbench.inputs
SERVER_PORT=7311
#SERVER_PORT=8080
QPS=300
THREADS=1
REQS=1000000 # Set this very high; the harness controls maxreqs
RAND_SEED=0
MINSLEEPNS=0
#TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=10000 ./img-dnn_server_networked \
#    -r ${THREADS} -f ${DATA_ROOT}/img-dnn/models/model.xml -n ${REQS} &
#echo $! > server.pid

#sleep 5 # Wait for server to come up

TBENCH_SERVER=147.46.240.226 TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_QPS=${QPS} TBENCH_MNIST_DIR=${DATA_ROOT}/img-dnn/mnist TBENCH_CLIENT_THREADS=${THREADS} TBENCH_MINSLEEPNS=${MINSLEEPNS} TBENCH_RANDSEED=${RAND_SEED} /ssd2/tailbench/tailbench/img-dnn/img-dnn_client_networked &
#TBENCH_SERVER=147.46.242.201 TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_WARMUPREQS=100 TBENCH_MAXREQS=1000 TBENCH_QPS=${QPS} TBENCH_MNIST_DIR=${DATA_ROOT}/img-dnn/mnist TBENCH_CLIENT_THREADS=1 TBENCH_MINSLEEPNS=0 TBENCH_RANDSEED=9 ./img-dnn_client_networked &
#TBENCH_SERVER=147.46.240.228 TBENCH_SERVER_PORT=7373 TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=10000 TBENCH_QPS=100 TBENCH_MNIST_DIR=${DATA_ROOT}/img-dnn/mnist TBENCH_CLIENT_THREADS=1 TBENCH_MINSLEEPNS=0 TBENCH_RANDSEED=4 ./img-dnn_client_networked &

echo $! > client.pid
echo $!

#wait $!
#wait $(cat client.pid)
# Clean up
#./kill_networked.sh
