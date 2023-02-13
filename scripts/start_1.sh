#!/bin/bash

here=`cd $(dirname $BASH_SOURCE); pwd`
root="$here/../"

cd $root
docker-compose up -d pulsar pulsar-proxy yugabyte
