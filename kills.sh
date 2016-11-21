#!/usr/bin/env bash

process=$1

pid=($(ps aux | grep $1 | awk  '{print $2F}'))

function usage() {
    echo "usage: kills process_name"
    exit 1;
}

for id in "${pid[@]}"
do
    kill -9 $id 
done
