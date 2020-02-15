#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

CMD=tile

pushd tile-project-repo

if [ "${VERSION}" == "" ]; then
  $CMD build
else
  $CMD build "${VERSION}"
fi

METADATA_FILE="product/metadata/${PRODUCT_NAME}.yml"
YAML_TO_JSON=("python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'")
echo ${METADATA_JSON} > manifest.json
VERSION=$(echo ${METADATA_JSON} | jq '.product_version' | sed -e 's/"//g')
tar czfvp "../tile-product/ecs-service-broker-${VERSION}.tgz" "ecs-service-broker-${VERSION}.pivotal" manifest.json
popd
