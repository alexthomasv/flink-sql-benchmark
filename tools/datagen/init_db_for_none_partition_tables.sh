#!/bin/bash
set -e

FLINK_BENCH_HOME=/home/psladmin/repo/flink-sql-benchmark
source $FLINK_BENCH_HOME/tools/common/env.sh

cd $FLINK_BENCH_HOME/hive-tpcds-setup
./tpcds-build.sh
./tpcds-setup.sh $SCALE
