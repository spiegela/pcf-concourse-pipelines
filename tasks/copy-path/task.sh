#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

if [[ "${FILENAME}" != "" ]]
then
    SOURCE="source/${FILENAME}"
else
    SOURCE="source"
fi

if [[ "${TARGET}" != "" ]]
then
    DEST="destination/${TARGET}"
else
    DEST="destination"
fi

cp -pr "${SOURCE}" "${DEST}"

ls -l "${DEST}"
