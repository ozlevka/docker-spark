#!/bin/bash

# . "/spark/sbin/spark-config.sh"

# . "/spark/bin/load-spark-env.sh"

#export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dspark.history.provider=org.apache.hadoop.fs.s3a.S3AFileSystem -Dspark.history.fs.logDirectory=s3a://ww-standalone/spark-dev/logs/"
export SPARK_DAEMON_MEMORY="24g"
export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dfs.s3.maxConnections=100 -Dfs.s3a.connection.timeout=50000 -Dspark.history.fs.numReplayThreads=45 -Dspark.history.retainedApplications=100  -Dspark.history.fs.logDirectory=s3a://ww-standalone/spark-dev/logs/"
/spark/sbin/start-history-server.sh
while sleep 1000; do :; done
# query_result='000'
# counter=1
# max_retries=20
# current_attempt=1
# while [[ 1 ]]; do
#      query_result=`curl -o /dev/null -s -w "%{http_code}\n" http://spark-master:8080`
#      if [[ "$query_result" == "200" ]]; then
#         echo "Start history server"
#         /spark/sbin/start-history-server.sh
#         while sleep 1000; do :; done
#      fi
     
#      echo "Spark master ready check return $query_result this is attemt number $current_attempt"
#      if [[ $current_attempt -ge $max_retries ]]; then
#             exit 1
#      else
#             sleep 5          
#      fi
#      current_attempt=$(( current_attempt + 1 ))
# done
