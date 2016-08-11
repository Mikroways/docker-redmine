#!/bin/bash

set -e
IFS=$'\n'

for plugin in $PLUGINS; do
  URL=`echo $plugin | awk -F " " '{print $1}'`
  FOLDER=`echo $plugin | awk -F " " '{print $2}'`
  if ! [ -d $FOLDER ]; then
    echo "git clone $URL $FOLDER"
  fi
done
