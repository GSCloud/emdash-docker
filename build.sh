#!/bin/bash

docker build -t emdash-preview . || exit 1
TMP_NAME="emdash-$RANDOM"
docker create --name "$TMP_NAME" emdash-preview
