#!/bin/bash
(docker rm cs511p1-main-1 cs511p1-worker2-1 cs511p1-worker1-1 || true) && \
docker build -t cs511p1-common -f cs511p1-common.Dockerfile . && \
    docker build -t cs511p1-main -f cs511p1-main.Dockerfile . && \
    docker build -t cs511p1-worker -f cs511p1-worker.Dockerfile . && \
    docker-compose -f cs511p1-compose.yaml up
