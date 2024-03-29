#~/bin/bash

CODE=0
SRCDIR=./src
OUTDIR=./out
BINDIR=./bin
REPORT=./script/report.sh

declare -A RETCODE=( \
    [succ]=$CODE \
    [text,$CODE]="[OK] Compilation succeeded" \
    [color,$CODE]="tput setaf 2"
    [noname]=$((++CODE)) \
    [text,$CODE]="[ERROR] Provide source file name w/o extension!" \
    [color,$CODE]="tput bold; tput setaf 1;"
    [nofile]=$((++CODE)) \
    [text,$CODE]="[ERROR] Filename is not available in filesystem!" \
    [color,$CODE]="tput bold; tput setaf 1;"
    [comperr]=$((++CODE)) \
    [text,$CODE]="[ERROR] Compilation ended with error(s)!" \
    [color,$CODE]="tput bold; tput setaf 1;"
)

function cleanup()
{
    eval ${RETCODE[color,$1]}
    echo ${RETCODE[text,$1]}
    eval "tput sgr0"

    if [ $1 -eq 0 ]; then
        if [ -n "$3" ]; then $REPORT $2 $4; fi
    fi
}

trap 'cleanup $? $@' EXIT

## main ##
ccflags='-std=c++17 -fsanitize=undefined -Werror'
rc=${RETCODE[succ]}

if [ -n "$1" ]; then
    outname=$OUTDIR/$1
    binname=$BINDIR/$1
    srcname=$SRCDIR/$1.cpp
    if [ -f $srcname ]; then
        g++ -O0 -ffunction-sections -fdata-sections -S $srcname -o $outname.s
        g++ -O0 -pg $srcname -o  $binname.gprof
        g++ $ccflags $srcname -o $binname 
        if [ $? -ne 0 ]; then
            rc=${RETCODE[comperr]}
        fi
    else rc=${RETCODE[nofile]}
    fi
else rc=${RETCODE[noname]}
fi

exit $rc

## end ##


