#!/bin/bash

set -e 

failure(){

    echo " Failed at $1:$2"
}

trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR

echo hello

echooo hello world

echo hey