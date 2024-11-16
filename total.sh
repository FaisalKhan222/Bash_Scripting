#!/bin/bash

show_help(){
	echo "Usage: $0 <file_path>"
	echo
	echo "This script reads the provided file line-by-line, ignoring lines that contains strings,"
	echo "and sums up the numerical values from the lines that contains numbers."
	echo
	echo "Parameters:"
	echo "	<file_path> Path to the input file to be processesd."
	echo
	echo "Example:"
	echo "	$0 input.txt"
	echo
	exit 1
}

if [ -z "$1" ]; then
	echo "Error: No file provided."
	show_help
fi

if [ "$1" == "--help" ]; then
	show_help
fi

if [ ! -f "$1" ]; then
	echo "Error: '$1' is not a valid file."
	exit 1
fi

total=0

while read line; do
	if ! [[ $line =~ ^[a-z]+$ ]]; then
		echo "Reading Line: $line"
		total=$(echo "$total+$line" | bc)
	fi
done < $1
echo "Total: $total"