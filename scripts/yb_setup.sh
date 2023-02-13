#!/bin/bash

set -e

here=`cd $(dirname $BASH_SOURCE); pwd`
root="$here/../"
cd $root

function create_cdc() {
  result=$(docker-compose exec yugabyte bin/yb-admin --master_addresses=yugabyte:7100 create_change_data_stream ysql.gondor IMPLICIT ALL)
  cdc_id=$(echo $result | sed 's/CDC Stream ID: //g')
  template_file=$root/confs/debezium/application.properties.template
  config_file=$root/confs/debezium/application.properties
  sed "s/__CDC_STREAM_ID__/${cdc_id}/g" $template_file > $config_file
  echo "Create Yugabyte CDC done"
}

function create_gondor_db() {
  docker-compose exec yugabyte bin/ysqlsh -h yugabyte --command="CREATE DATABASE gondor"
  echo "Create Yugabyte DB gondor done"
}

create_gondor_db || true
create_cdc
