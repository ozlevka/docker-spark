#!/bin/bash

export SPARK_DAEMON_MEMORY="24g"
#export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dfs.s3.maxConnections=100 -Dfs.s3a.connection.timeout=50000 -Dspark.history.fs.numReplayThreads=45 -Dspark.history.retainedApplications=100  -Dspark.history.fs.logDirectory=s3a://ww-standalone/spark-dev/logs/"
export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dspark.history.fs.logDirectory=s3a://ww-standalone/spark-dev/logs/ -Dspark.history.store.path=/data"
/spark/sbin/start-history-server.sh
while sleep 1000; do :; done