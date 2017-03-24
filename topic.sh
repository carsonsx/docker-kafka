#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo 'Usage:'
    echo '  ./topic.sh create test --replication-factor 2 --partitions 10'
    echo '  ./topic.sh list'
    echo '  ./topic.sh describe test'
    exit 0
fi

topic=$2
if [ -n "$topic" ]; then
    topic="--topic $topic"
fi

docker run --rm --net mynet -it --entrypoint bin/kafka-topics.sh carsonsx/kafka --$1 --zookeeper zookeeper-kafka:2181 $topic $3 $4 $5 $6
