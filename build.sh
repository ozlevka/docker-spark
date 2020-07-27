#!/bin/bash

set -e

TAG=2.2.0

build() {
    NAME=$1
    DIR=$NAME
    if [[ "$DIR" = "dev" ]]; then
        DIR=".devcontainer"
    fi
    IMAGE=ozlevka/spark-$NAME-debian:$TAG
    cd $([ -z "$2" ] && echo "./$DIR" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    docker push $IMAGE
    cd -
}

build base
build master
build worker
build dev
build history
# build submit
# build java-template template/java
# build scala-template template/scala
# build python-template template/python
