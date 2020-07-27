FROM ozlevka/spark-base-debian:2.2.0

LABEL maintainer="ozlevka@gmail.com"

COPY worker.sh /

ENV SPARK_WORKER_LOG /spark/logs


CMD ["/bin/bash", "/worker.sh"]
