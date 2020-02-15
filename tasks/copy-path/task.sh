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

cp -pr "${SOURCE}" "${DESTINATION}"

ls -l "${DESTINATION}"
