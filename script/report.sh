#~/bin/bash

CODE=0
OUTDIR=./out
BINDIR=./bin

declare -A RETCODE=( \
    [succ]=$CODE \
    [text,$CODE]="[OK] Report generated" \
    [color,$CODE]="tput setaf 2"
    [noname]=$((++CODE)) \
    [text,$CODE]="[ERROR] Provide binary file name!" \
    [color,$CODE]="tput bold; tput setaf 1;"
    [nofile]=$((++CODE)) \
    [text,$CODE]="[ERROR] Filename is not available in filesystem!" \
    [color,$CODE]="tput bold; tput setaf 1;"
    [reperr]=$((++CODE)) \
    [text,$CODE]="[ERROR] Report generation error(s)!" \
    [color,$CODE]="tput bold; tput setaf 1;"
)

function cleanup()
{
    eval ${RETCODE[color,$1]}
    echo ${RETCODE[text,$1]}
    eval "tput sgr0"
}

trap 'cleanup $?' EXIT

## main ##
rc=${RETCODE[succ]}

if [ -n "$1" ]; then
    line=""
    binname=$BINDIR/$1
    output=$2
    reportname=$OUTDIR/$1.report
    if [ -f $binname ]; then
        > $reportname
        sec=""
        details=$(readelf -Ws $binname)
        while read val; do 
            secidx=$(echo $val|sed -ne "s/^\[\(.*\)\].*$/\1/p")
            if [ -n "$secidx" ]; then
                sec=$secidx
                line=$val
            elif [ -n "$sec" ]; then
                line="$line\t$val"
                if [ $sec -eq $sec ] 2>/dev/null; then
                    res=$(echo "$details"|tr -s ' '|cut -d' ' -f3-9|awk '{print $6,$1,$2,$3,$4,$5,$7}'|grep -w "^$sec .*"|cut -d' ' -f2-|sort)
                    if [ -n "$res" ]; then
                        line="$line\n$res"
                    fi
                fi
                sec=""
            fi
            if [ -n "$line" -a -z "$sec" ]; then
                if [ -n "$output" ]; then echo -e "$line"; fi
                echo -e "$line" >> $reportname
            fi
        done <<< $(readelf $binname -S)

        $binname.gprof
        profname=./gmon.out
        if [ -f $profname ]; then
            mv $profname $OUTDIR
            profname=$OUTDIR/$profname
            timeprof=$(gprof -b $binname.gprof $profname)
            if [ -n "$output" ]; then echo -e "$timeprof"; fi
            echo -e "$timeprof" >> $reportname
        fi


        if [ $? -ne 0 ]; then rc=${RETCODE[reperr]}; fi
    else
        rc=${RETCODE[nofile]}
    fi
else rc=${RETCODE[noname]}
fi

exit $rc

## end ##


