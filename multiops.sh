#!/bin/bash

# This script takes as arguments numbers and what type of Math Operation the user wants to perform.
# Usage: ./multiops.sh [option] numbers 

sum(){
    # This function sums two or a list of numbers
    total=0
    for num in "$@"; do
        total=$((total+num))
    done
    echo "The sum is: $total"
}

mul(){
    # This function multiplies the numbers provided
    total=1
    for num in "$@"; do
        total=$((total*num))
    done
    echo "The result of multiplication is: $total"
}

sub(){
    # This function subtracts two or a list of numbers
    if [ $# -lt 2 ]; then
        echo "Please provide at least two numbers for subtraction."
        return 1
    fi
    
    total=$1
    shift  # Shift to get the rest of the numbers
    
    for num in "$@"; do
        total=$((total - num))
    done
    echo "The result of subtraction is: $total"
}

fac(){
    # This function gives the factorial of the number $1
    factorial=1
    for ((i=1; i<=$1; i++)); do
        factorial=$((factorial*i))
    done
    echo "The factorial of the number $1 is $factorial"
}

show_help(){
    echo "Usage:"
    echo "    $0 -sub num1 num2 ...    (to subtract two or list of numbers)"
    echo "    $0 -mul num1 num2 ...    (to multiply two or list of numbers)"
    echo "    $0 -sum num1 num2 ...    (to sum two or list of numbers)"
    echo "    $0 -fac num              (to find the factorial of the number)"
    exit 1
}

if [ "$#" -lt 2 ]; then
    show_help
fi

case "$1" in
    -sub)
        sub "${@:2}"
        ;;
    -sum)
        sum "${@:2}"
        ;;
    -fac)
        if [ "$#" -ne 2 ]; then
            show_help
        fi
        fac "$2"
        ;;
    -mul)
        mul "${@:2}"
        ;;
    --help)
        show_help
        ;;
    *)
        show_help
        ;;
esac