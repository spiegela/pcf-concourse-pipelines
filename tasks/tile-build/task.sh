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

cp product/*.pivotal ../tile-product

popd
