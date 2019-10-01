#!/bin/bash

#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#source ${DIR}/../configs.sh

DATA_ROOT=/ssd/tailbench/tailbench.inputs
THREADS=1
REQS=100000000 # Set this very high; the harness controls maxreqs

#TBENCH_NCLIENTS=1 TBENCH_SERVER=147.46.240.226 TBENCH_SERVER_PORT=7373 TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=10000 ./img-dnn_server_networked \
TBENCH_NCLIENTS=1 TBENCH_SERVER=0.0.0.0 TBENCH_SERVER_PORT=7373 TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=10000 ./img-dnn_server_networked \
    -r ${THREADS} -f ${DATA_ROOT}/img-dnn/models/model.xml -n ${REQS} &
echo $! > server.pid

sleep 10 # Wait for server to come up
#TBENCH_QPS=500 TBENCH_MNIST_DIR=${DATA_ROOT}/img-dnn/mnist ./img-dnn_client_networked &

#echo $! > client.pid

#wait $(cat client.pid)
# Clean up
#./kill_networked.sh
