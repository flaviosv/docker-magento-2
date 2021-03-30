#!/bin/bash

docker-compose build \
    --build-arg USER=$USER \
    --build-arg UID=$(id -u ${USER}) \
    --build-arg GROUP=$(id -gn ${USER}) \
    --build-arg GID=$(id -g ${USER}) \
    ; \
 docker-compose up