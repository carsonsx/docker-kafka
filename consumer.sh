#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo 'Usage: ./consumer.sh broker-server topic-name'
    exit 0
fi

docker run --rm --net mynet -it --entrypoint bin/kafka-console-consumer.sh carsonsx/kafka --bootstrap-server $1:9092 --from-beginning --topic $2
