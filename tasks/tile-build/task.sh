#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

CMD=tile

pushd tile-project-repo
$CMD build
cp product/*.pivotal out
popd
