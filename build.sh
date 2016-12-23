#!/bin/bash
set -e

cd $(dirname $0)
DO_PUSH="$1" 

if [ "${DO_PUSH}" != "--push" ]; then     
    if [ ! -e ./dist ]; then 	
        mkdir -p ./dist     
    fi     
    
    rm -rf ./dist/* 
fi 

./scripts/build-image $DO_PUSH
