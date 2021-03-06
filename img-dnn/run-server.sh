#!/bin/bash 
SERVER_PORT=7311
DATA_ROOT=/ssd/tailbench/tailbench.inputs
MAXREQS=100000000
WARMUP=100000000
SERVER_THREADS=2
#REQS=6000 # Set this very high; the harness controls maxreqs
REQS=1000000 # Set this very high; the harness controls maxreqs
WARMUP_TIME=5
MEASURE_TIME=60

#TBENCH_NCLIENTS=1 TBENCH_SERVER=147.46.240.226 TBENCH_SERVER_PORT=7373 TBENCH_WARMUPREQS=5000 TBENCH_MAXREQS=10000 ./img-dnn_server_networked \
TBENCH_WARMUPTIME=${WARMUP_TIME} TBENCH_MEASURETIME=${MEASURE_TIME} TBENCH_NCLIENTS=1 TBENCH_SERVER=0.0.0.0 TBENCH_SERVER_PORT=${SERVER_PORT} TBENCH_WARMUPREQS=${WARMUP} TBENCH_MAXREQS=${MAXREQS} \
/ssd/tailbench/tailbench-v0.9/img-dnn/img-dnn_server_networked \
-r ${SERVER_THREADS} -f ${DATA_ROOT}/img-dnn/models/model.xml -n ${REQS} 
echo $! > server.pid

sleep 1 # Wait for server to come up
