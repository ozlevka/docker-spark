#!/bin/bash

set -e

if [[ -n "$1" ]]; then
    TAG="$1"
else
    TAG=$(date +%Y%m%d%H%M)
fi

build() {
    NAME=$1
    DIR=$NAME
    if [[ "$DIR" = "dev" ]]; then
        DIR=".devcontainer"
    fi
    IMAGE=ozlevka/spark-$NAME:$TAG
    cd $([ -z "$2" ] && echo "./$DIR" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    docker push $IMAGE
    cd -
}

build base
build dev
build master
build worker
#build submit
#build java-template template/java
#build scala-template template/scala
#build python-template template/python
