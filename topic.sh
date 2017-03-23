docker run --rm --net mynet -it --entrypoint bin/kafka-topics.sh carsonsx/kafka --$1 --zookeeper zookeeper:2181 $2
