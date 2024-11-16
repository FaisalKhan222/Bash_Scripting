#!/bin/bash

# This script takes a string as an argument and find all the permutation of that string using string slicing
# Usage: ./rotate.sh [string]

show_help(){
	echo "Usage:"
	echo "$0	[string]	to find the permutations of the string"
	echo "$0	--help 		to show this help"
}

if [ "$#" -lt 1 ]; then
	show_help
fi

str=$1
len=${#str}

for ((i=0; i<len; i++))
do
	rotate="${str:i}${str:0:i}"
	echo "$rotate"
done