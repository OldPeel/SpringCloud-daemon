#!/usr/bin/env bash

export cur_home=$(cd `dirname $0`; pwd)

cd ${cur_home}

git pull

mvn clean package

#java -jar tensquare_admin_service/target/tensquare_admin_service-1.0-SNAPSHOT.jar
#java -jar tensquare_eureka_server/target/tensquare_eureka_server-1.0-SNAPSHOT.jar
#java -jar tensquare_gathering/target/tensquare_gathering-1.0-SNAPSHOT.jar
#java -jar tensquare_zuul/target/tensquare_zuul-1.0-SNAPSHOT.jar

