#!/usr/bin/env bash

export cur_home=$(cd `dirname $0`; pwd)

cd ${cur_home}

git pull

mvn clean package
