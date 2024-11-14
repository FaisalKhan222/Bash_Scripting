#!/bin/bash

# this is simple script that prompts the user to input a file name, then displays wether the file exists in the current directory or not.
# Usage: ./exists.sh [filename] or ./exists.sh --help

#display help message
show_help() {
	echo "Usage: $0 [options] [filename]"
	echo
	echo "Check if a file exists in the current directory."
	echo
	echo "Options:"
	echo "  --help	Display this help message."
	echo "  [filename]	The name of the file to check in the current directory."
}

if [[ "$1" == "--help" ]]; then
	show_help
	exit 0
fi

if [ -z "$1" ]; then
	read -p "Enter file name>" file
else
	file="$1"
fi

if [ -f "$file" ]; then
	echo "file '$file' does exists in the current directory."
elif [ -e "$file" ]; then
	echo "file '$file' does exists, but it is not a regular file (could be directory or special file)."
else
	echo "file '$file' does not exists in the current directory"
fi