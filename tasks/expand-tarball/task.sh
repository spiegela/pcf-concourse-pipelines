#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

SOURCE="source/${FILENAME}"

if [[ "${INTO_SOURCE}" == "true" ]]; then
  DEST=source
else
  DEST=destination
fi

if [[ "${TARGET}" != "" ]]; then
    DEST="$DEST/${TARGET}"
fi

pushd $DEST
  tar zxfvp ../"${SOURCE}"
  ls -l
popd
