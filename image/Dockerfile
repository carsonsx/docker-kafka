FROM java

MAINTAINER carsonsx <carsonsx@qq.com>

# Please download kafka from offical site first and unzip to here and rename to kafka
COPY kafka /usr/local/kafka

WORKDIR /usr/local/kafka

ENTRYPOINT ["bin/kafka-server-start.sh", "config/server.properties"]

