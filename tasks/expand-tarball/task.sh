#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

SOURCE="source/${FILENAME}"

if [[ "${TARGET}" != "" ]]
then
    DEST="destination/${TARGET}"
else
    DEST="destination"
fi

pushd $DEST
  tar zxfvp ../"${SOURCE}"
  ls -l
popd
