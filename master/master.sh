#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

mkdir -p /tmp/spark-events

export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dspark.history.fs.logDirectory=file:/tmp/spark-events"

/spark/sbin/start-history-server.sh

cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out


