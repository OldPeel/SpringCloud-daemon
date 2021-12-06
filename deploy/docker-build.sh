#!/usr/bin/env bash

export cur_home=$(cd `dirname $0`; pwd)

cd ${cur_home}

function docker_build_base(){
  dockerfile="${cur_home}/Dockerfile.base"
  image="ubuntu1804-java8"
  version="1.0.0"

  #docker build -t smartbooks/ubuntu1804-java8:1.0.0 -f Dockerfile.base .
  #docker build -t <hub-user>/<repo-name>[:<tag>]
  #docker push <hub-user>/<repo-name>:<tag>

  docker build -t ${image}:${version} -f ${dockerfile} ../
  docker push ${image}:${version}
}

function docker_build_admin(){
  dockerfile="${cur_home}/Dockerfile.admin"
  image="tensquare_admin_service"
  version="1.0.0"

  docker build -t ${image}:${version} -f ${dockerfile} ../
  docker push ${image}:${version}
}

function docker_build_eureka(){
  dockerfile="${cur_home}/Dockerfile.eureka"
  image="tensquare_eureka_server"
  version="1.0.0"

  docker build -t ${image}:${version} -f ${dockerfile} ../
  docker push ${image}:${version}
}

function docker_build_gathering(){
  dockerfile="${cur_home}/Dockerfile.gathering"
  image="tensquare_gathering"
  version="1.0.0"

  docker build -t ${image}:${version} -f ${dockerfile} ../
  docker push ${image}:${version}
}

function docker_build_zuul(){
  dockerfile="${cur_home}/Dockerfile.zuul"
  image="tensquare_zuul"
  version="1.0.0"

  docker build -t ${image}:${version} -f ${dockerfile} ../
  docker push ${image}:${version}
}

# docker login registry.cn-beijing.aliyuncs.com -u user -p pwd

docker_build_admin

docker_build_eureka

docker_build_gathering

docker_build_zuul
