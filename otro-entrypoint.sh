#!/bin/bash

set -e
IFS=$'\n'

urls=$PLUGINS
for i in ${urls[@]}; do
    comando="git clone"
    IFS=$' '
    for j in ${i[@]}; do
        if [ -d $j ]; then #Si la carpeta existe, no se clonara el respositorio
            comando=""       
            break
        else
            comando+=" $j"
        fi
    done
    $comando
    IFS=$'\n'
done
