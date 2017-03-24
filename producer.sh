
if [ -z "$1" ]; then
    echo 'Usage: ./producer.sh broker-server-list topic-name'
    exit 0
fi

docker run --rm --net mynet -it --entrypoint bin/kafka-console-producer.sh carsonsx/kafka --broker-list $1 --topic $2
