FROM ghcr.io/ozlevka/spark-base:2.4.7-debian

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

COPY worker.sh /

ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"


CMD ["/bin/bash", "/worker.sh"]
