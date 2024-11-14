#!/bin/bash

name="cursoms-gateway"
network="cursoms-network"
eureka_server="cursoms-eureka"
keycloak_server="cursoms-keycloak"
keycloak_port=8080

docker stop "${name}" ;\
docker rm -f "${name}" ;\
docker image rm -f "${name}" ;\
docker build --tag "${name}" . ;\
docker run --name "${name}" -p 8080:8080 --network "${network}" -e EUREKA_SERVER="${eureka_server}" -e KEYCLOAK_SERVER="${keycloak_server}" -e KEYCLOAK_PORT="${keycloak_port}" "${name}"
