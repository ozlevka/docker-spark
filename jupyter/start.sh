#!/bin/bash -x

cd /home/jupyter
PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --ip=0.0.0.0 --port=7777"
/spark/bin/pyspark --master spark://spark-master:7077