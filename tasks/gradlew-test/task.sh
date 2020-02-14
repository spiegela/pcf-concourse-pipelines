#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

CMD=./gradlew

pushd project-repo
$CMD --no-daemon test
popd
