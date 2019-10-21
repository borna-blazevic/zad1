#!/bin/bash

atoi () {
    re='^[-]?[0-9]+$'
    if [[ $1 =~ $re ]]; then
        echo $1
        exit 0
    else
        echo 0
        exit 0
    fi
}

itoa () {
    let number=$(atoi $1)
    let base=$(atoi $2)
    let negative=false
    if [ $number == 0 ]; then
        echo 0
        exit 0
    fi
    if [ $base == 0 ]; then
        echo "unsupported base"
        exit 0
    fi
    if [[ $number -lt 0 ]]; then
        isNegative=true
        number=$(( $number * -1 ))
        echo $number
    fi
    rez=""
    while [[ $number -gt 0 ]]; do
        rem=$(( $number % $2 ))
        number=$(( $number / $2 ))
        if [[ $rem -gt 10 ]]; then
            rem=$(( $rem + 55 ))
            printf -v newchar \\$(printf '%03o' "$rem")
            rez+="$newchar"
        else
            rez+="$rem"
        fi
    done

    if [[ $isNegative ]]; then
        rez+="-"
    fi
    echo $rez|rev
}


if [ "$1" == "atoi" ]; then
    atoi $2
elif [ "$1" == "itoa" ]; then
    itoa $2 $3
    exit 0
else
    echo "Function call should look like ./5.sh [atoi or itoa] <input> <base if itoa>"
    exit 1
fi


