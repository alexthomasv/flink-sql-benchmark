#!/bin/bash
set -e

FLINK_BENCH_HOME=/home/psladmin/repo/flink-sql-benchmark
source $FLINK_BENCH_HOME/tools/common/env.sh

cd $FLINK_BENCH_HOME/hive-tpcds-setup

export HIVE_HOME=/usr/local/hive
export HIVE_BIN="$HIVE_HOME/bin/beeline -u jdbc:hive2://ip-172-31-3-129:10000/default -n psladmin -p ''"
DEBUG_SCRIPT=1 ./tpcds-setup_partitioned.sh $SCALE
