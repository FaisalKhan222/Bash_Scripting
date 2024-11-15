#!/bin/bash

# this script asks for one input name and goes in the directory name if exists. if there is no such directory, it displays the content of the file if exits
# otherwise it creates a new directory.
# Usage: ./go.sh or ./go.sh --help

show_help(){
	echo "Usage: $0 [options]"
	echo
	echo "if the input is Directory it goes to that directory"
	echo "if the input is file it displayes the content of the file"
	echo "if neither it creates a directory"
	echo
	echo "Options:"
	echo "	--help	Display this help message."
}

if [[ "$1" == "--help" ]]; then
	show_help
	exit 0
fi

read -p "Enter name> " name

if [ -d "$name" ]; then
		cd "$name"
		echo "Directory has been changed to $name"
		echo "Listing $name:"
		ls -la
elif [ -e "$name" ]; then
	echo "Displying the content of $name"
	cat "$name"
else
	mkdir "$name"
	echo "Directory has been created"
fi