#!/bin/bash
source /home/psladmin/repo/flink-sql-benchmark/tools/common/env.sh

echo /home/psladmin/repo/flink-sql-benchmark/packages/flink-1.16.0/bin/flink run -c com.ververica.flink.benchmark.AnalyzeTableRunner ${FLINK_TEST_JAR} ${FLINK_TEST_DB}
/home/psladmin/repo/flink-sql-benchmark/packages/flink-1.16.0/bin/flink run -c com.ververica.flink.benchmark.AnalyzeTableRunner ${FLINK_TEST_JAR} ${FLINK_TEST_DB} /usr/local/hive/conf/