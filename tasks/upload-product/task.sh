#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

ls -l ./om-cli

chmod +x om-cli/om
CMD=./om-cli/om

FILE_PATH=`find ./pivnet-product -name *.pivotal`

$CMD -e env/${OPSMAN_ENV_FILE_NAME} upload-product -p $FILE_PATH
