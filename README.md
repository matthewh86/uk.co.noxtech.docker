#uk.co.noxtech.docker
Example consumer, queue, producer application which send Telephone objects from
the producer, to the Rabbit MQ instance specified by the environment variable
RABBIT_MQ_IP, and is read into the consumer.

Consumer, Producer and Data projects are written in Java 8.

## Prerequisites
This needs the following to be installed:
* Docker
* Docker Compose
* Java 8

## Build and Run
1.To build the docker images, check out the full project structure:
* uk.co.noxtech.docker
* uk.co.noxtech.docker.data
* uk.co.noxtech.docker.consumer
* uk.co.noxtech.docker.producer
* uk.co.noxtech.docker.rabbitmq
2. run ./dockerBuild.sh
3. run docker-compose up

## Useful commands
* **gradle build**      - builds the applications
* **gradle distDocker** - builds the docker containers from the applications
* **gradle idea**       - adds the IntelliJ Idea project files

##Technologies used
* Docker
* Docker-Compose
* Gradle
* Gradle-Docker
* Google Phone Number Library
* Jackson
* Java 8
* JUnit
* RabbitMQ
* Spring Boot
* Spring Dependency Injection
* Spring Framework Webservices
