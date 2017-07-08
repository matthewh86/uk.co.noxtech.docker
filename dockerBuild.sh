#!/bin/bash

rm .env

docker-compose stop

gradle clean build distDocker
docker-compose build --no-cache
docker-compose start rabbitmq

RABBIT_MQ_IP=0
while [ $RABBIT_MQ_IP = 0 ]; do
    RABBIT_MQ_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=rabbitmq"))
    echo "Waiting for rabbitmq..."
    sleep 1
done

echo "Found RabbitMQ IP: $RABBIT_MQ_IP"
echo "RABBIT_MQ_IP=$RABBIT_MQ_IP" &> .env

docker-compose start consumer
docker-compose start producer
