#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

chmod +x om-cli/om
CMD=./om-cli/om

$CMD -e config/$OPSMAN_ENV_FILE_NAME delete-installation
