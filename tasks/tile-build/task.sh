#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

PIP_CMD=pip
TILE_CMD=tile

chmod +x ./jq/jq-linux64
JQ_CMD=./jq/jq-linux64

$PIP_CMD install pyyaml

pushd tile-project-repo
  if [ "${VERSION}" == "" ]; then
    $TILE_CMD build
  else
    $TILE_CMD build "${VERSION}"
  fi
  METADATA_FILE="product/metadata/${PRODUCT_NAME}.yml"
  METADATA_JSON=$(python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < "${METADATA_FILE}")
popd

pushd tile-product
  echo ${METADATA_JSON} > manifest.json
  VERSION=$(../$JQ_CMD '.product_version' < manifest.json | sed -e 's/"//g')
  mv ./tile-project-repo/product/ecs-service-broker-${VERSION}.pivotal .

  tar czfvp "ecs-service-broker-${VERSION}.tgz" "ecs-service-broker-${VERSION}.pivotal" manifest.json
popd
