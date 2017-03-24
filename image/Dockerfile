FROM java:8

MAINTAINER carsonsx <carsonsx@qq.com>

# Please download kafka from offical site first and unzip to here and rename to kafka
COPY kafka /usr/local/kafka

WORKDIR /usr/local/kafka

EXPOSE 9092 7203

ENTRYPOINT ["bin/kafka-server-start.sh", "config/server.properties"]

