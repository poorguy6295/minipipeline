#!/bin/bash

set -e

here=`cd $(dirname $BASH_SOURCE); pwd`
root="$here/../"
cd $root

function seed_db() {
  docker-compose exec yugabyte bin/ysqlsh -h yugabyte --file=/home/anduin/seed.sql gondor
  echo "Seed Yugabyte done"
}

seed_db
