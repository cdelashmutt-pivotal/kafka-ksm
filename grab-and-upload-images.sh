#!/bin/bash

if [ ! $# -eq 1 ]; then
  echo "Must supply FQDN or IP for docker registry to relocate images to."
  exit 1
fi

REMOTE_HOST=$1

function grab_local() {
    source_image=$1
    docker pull $source_image
}

function push_remote() {
    remote_host=$1
    source_image=$2
    remote_image=$remote_host/$source_image
    docker tag $source_image $remote_image
    docker push $remote_image
}

images=(
"bitnami/kafka:2.5.0-debian-10-r84"
"bitnami/kubectl:1.17.4-debian-10-r107"
"bitnami/minideb:buster"
"bitnami/kafka-exporter:1.2.0-debian-10-r156"
"bitnami/jmx-exporter:0.13.0-debian-10-r46"
"bitnami/zookeeper:3.6.1-debian-10-r65"
)

for image in ${images[@]}; do
  grab_local $image
done

for image in ${images[@]}; do
  push_remote $REMOTE_HOST $image
done