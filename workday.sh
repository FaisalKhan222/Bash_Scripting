#!/bin/bash

# this script promots the user to input a day in a week, then displays wther the day is workday or weekend
# Usage: ./workday.sh [dayname] or ./workday.sh --help

show_help(){
	echo "Usage: $0 [options] [dayname]"
	echo
	echo "checks if the day is workday or weekend."
	echo
	echo "Options:"
	echo "	--help	Display thi help message."
	echo "	[dayname]	The name of the day in the week."
}

if [[ "$1" == "--help" ]]; then
	show_help
	exit 0
fi

if [ -z "$1" ]; then
	read -p "Enter Day Name>" day
	day=$(echo "$day" | tr '[:upper:]' '[:lower:]')
else
	day=$(echo "$1" | tr '[:upper:]' '[:lower:]')
fi


case $day in
	sunday | monday | tuesday | wednesday | thursday)
		echo "$day is a workday"
		;;
	friday | saturday)
		echo "$day is a weekend"
		;;
	*)
		echo "$day is not a Day"
		;;
esac