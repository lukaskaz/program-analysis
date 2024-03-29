#!/bin/bash

CODE=0

declare DIRSTOCLEAN=(
./bin 
./out
)

declare -A RETCODE=( \
    [succ]=$CODE \
    [text,$CODE]="[OK] Clean succeeded" \
    [color,$CODE]="tput setaf 2"
    [nodir]=$((++CODE)) \
    [text,$CODE]="[ERROR] Directory not exist!" \
    [color,$CODE]="tput bold; tput setaf 1;"
    [rmerr]=$((++CODE)) \
    [text,$CODE]="[ERROR] Cannot remove content!" \
    [color,$CODE]="tput bold; tput setaf 1;"
)

function cleanup()                                                                                
{   
    eval ${RETCODE[color,$1]}
    echo ${RETCODE[text,$1]}
    eval "tput sgr0"
}

trap 'cleanup $?' EXIT

rc=${RETCODE[succ]}

for dir in ${DIRSTOCLEAN[*]}; do
    if [ ! -d $dir ]; then
        echo "No directory: $dir"
        rc=${RETCODE[nodir]}
        break
    elif [ -n "$(ls $dir)" ]; then
        echo "Cleaning directory: $dir"
        rm $dir/*
        if [ $? -ne 0 ]; then rc=${RETCODE[rmerr]}; break; fi
    else
        echo "Empty directory: $dir"
    fi
done
exit $rc

