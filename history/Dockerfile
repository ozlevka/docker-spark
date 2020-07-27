FROM ozlevka/spark-base-debian:2.2.0

LABEL maintainer="ozlevka@gmail.com"

COPY hadoop-aws-2.7.3.jar aws-java-sdk-1.7.4.jar /spark/jars/
COPY history.sh /

ENV SPARK_MASTER "spark://spark-master:7077"

CMD ["/bin/bash", "/history.sh"]