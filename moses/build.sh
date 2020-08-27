#!/bin/bash

export TBENCH_PATH=${PWD}/../harness
export CPATH=${TBENCH_PATH}${CPATH:+:$CPATH}
./bjam toolset=gcc-5 -j32 -q
#./bjam toolset=gcc -j32 -q
