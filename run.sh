docker rm -f kafka1 kafka2 kafka3
docker run --name kafka1 --net mynet -d carsonsx/kafka --override broker.id=1 --override zookeeper.connect=zookeeper:2181
docker run --name kafka2 --net mynet -d carsonsx/kafka --override broker.id=2 --override zookeeper.connect=zookeeper:2181
docker run --name kafka3 --net mynet -d carsonsx/kafka --override broker.id=3 --override zookeeper.connect=zookeeper:2181

