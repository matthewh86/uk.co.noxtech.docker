#!/bin/bash

rm -fq .env

docker-compose down

./gradlew clean
./gradlew build
./gradlew distDocker

docker-compose build --no-cache

x-terminal-emulator -e docker-compose up rabbitmq

RABBIT_MQ_IP=""
while [ "$RABBIT_MQ_IP" = "" ]; do
    RABBIT_MQ_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=rabbitmq"))
    echo "Waiting for rabbitmq..."
    sleep 1
done

echo "Found RabbitMQ IP: $RABBIT_MQ_IP"
echo "RABBIT_MQ_IP=$RABBIT_MQ_IP" &> .env

x-terminal-emulator -e docker-compose up producer
x-terminal-emulator -e docker-compose up consumer
