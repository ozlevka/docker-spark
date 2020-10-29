FROM ozlevka/spark-base:2.4.4-debian

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

COPY entrypoint.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
#ENV SPARK_MASTER "spark://spark-master:7077"
ENV SPARK_HOME="/spark"
ENV SPARK_EXECUTOR_MEMORY=2Gi

EXPOSE 8081

ENTRYPOINT [ "/entrypoint.sh" ]
