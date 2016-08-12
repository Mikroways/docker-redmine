#!/bin/bash

set -e
IFS=$'\n'
plug="https://github.com/Undev/redmine_issue_checklist.git plugins/redmine_issue_checklist"
for plugin in $plug; do
  URL=`echo $plugin | awk -F " " '{print $1}'`
  FOLDER=`echo $plugin | awk -F " " '{print $2}'`
  if ! [ -d $FOLDER ]; then
    git clone $URL $FOLDER
  fi
done
