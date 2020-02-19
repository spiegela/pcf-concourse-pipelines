#!/bin/bash

if [[ $DEBUG == true ]]; then
  set -ex
else
  set -e
fi

CURL=/usr/bin/curl
FLAGS=()

if [ "${VERBOSE}" == "true" ]; then
  FLAGS=("-v" "${FLAGS[@]}")
fi

if [ "${INSECURE}" == "true" ]; then
  FLAGS=("-k" "${FLAGS[@]}")
fi

if [ "${OUTPUT}" != "" ]; then
  FLAGS=("-o" "output/${OUTPUT}" "${FLAGS[@]}")
fi

if [ "${METHOD}" != "" ] && [ "${METHOD}" != "GET" ]; then
  FLAGS=("-X" "${METHOD}" "${FLAGS[@]}")
fi

$CURL "${FLAGS[@]}" "${URL}"
