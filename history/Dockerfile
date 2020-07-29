FROM ozlevka/spark-base-debian:2.4.4-debian

LABEL maintainer="ozlevka@gmail.com"

RUN cd /spark/jars \
    && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar \
    && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar

COPY history.sh /

ENV SPARK_MASTER "spark://spark-master:7077"

CMD ["/bin/bash", "/history.sh"]