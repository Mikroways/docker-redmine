#!/bin/bash

set -e
IFS=$'\n'

if [ -z ${PLUGINS+} ]; then
  echo "PLUGINS variable is not set. Aborting execution..."
  exit 1
fi

for plugin in $PLUGINS; do
  URL=`echo $plugin | awk -F " " '{print $1}'`
  FOLDER=`echo $plugin | awk -F " " '{print $2}'`
  if ! [ -d $FOLDER ]; then
    echo "git clone $URL $FOLDER"
  fi
done
