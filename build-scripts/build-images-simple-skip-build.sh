#!/bin/bash

function build_basic_images() {
  JAR_FILE=$1
  APP_NAME=$2

  docker build -f ./build-scripts/docker/basic/Dockerfile \
    --build-arg JAR_FILE=${JAR_FILE} \
    -t ${APP_NAME}:latest \
    -t ${APP_NAME}:simple .
}

APP_VERSION=0.0.1-SNAPSHOT

# Building the app
cd ..

echo "Building Docker images"
build_basic_images ./medical-monitoring/core/target/monitoring-core-${APP_VERSION}.jar application/medical-monitoring
build_basic_images ./message-analyzer/core/target/analyzer-core-${APP_VERSION}.jar application/message-analyzer
build_basic_images ./person-service/core/target/service-core-${APP_VERSION}.jar application/person-service