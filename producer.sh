docker run --rm --net mynet -it --entrypoint bin/kafka-console-producer.sh carsonsx/kafka --broker-list $1:9092 --topic $2
