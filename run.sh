#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo 'Usage: run.sh broker-id [expose-port]'
    exit 0
fi

set -x
#set -e
set -o pipefail

result=`docker network inspect mynet | grep 'Error: No such network'`

if [ -n "$result" ]; then
    docker network create mynet
else
    echo 'network mynet exists'
fi

result=`docker ps | grep zookeeper-kafka`

if [ ! -n "$result"  ]; then
    docker rm zookeeper-kafka
    docker run --name zookeeper-kafka --net mynet -p2181:2181 -d zookeeper 
else
    echo 'kafka zookeeper exists'
fi

#broker id
bid=$1
#broker name
bname=kafka$bid

result=`docker ps | grep $bname`

if [ -n "$result" ]; then
    docker rm -f $bname
    sleep 5
else
    result=`docker ps -a | grep $bname`
   if [ -n "$result" ]; then
        docker rm $bname
   fi
fi

#broker expose port
bport=$2
eport=

if [ -n "$bport" ]; then
    eport="-p $bport:9092"
fi

#docker run --name $bname --net mynet $eport -d carsonsx/kafka --override broker.id=$bid --override zookeeper.connect=zookeeper-kafka:2181
docker run --name $bname --net mynet $eport -d carsonsx/kafka --override broker.id=$bid --override advertised.host.name=10.20.109.125 --override advertised.port=$bport --override zookeeper.connect=10.20.109.125:2181

#docker logs -f $bname
