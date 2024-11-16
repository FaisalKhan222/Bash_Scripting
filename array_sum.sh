#!/bin/bash

show_help() {
    echo "Usage: $0 <num>"
    echo
    echo "This script prompts the user to enter <num> numbers and calculates their average."
    echo
    echo "Parameters:"
    echo "  <num>   The number of inputs (integers) the user will provide."
    echo
    echo "Example:"
    echo "  $0 3"
    echo
    exit 1
}


if [ -z "$1" ]; then
    echo "Error: No argument provided."
    show_help
fi

if [ "$1" == "--help" ]; then
    show_help
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: '$1' is not a valid integer."
    exit 1
fi


num=$1


numbers=()


echo "Enter $num numbers:"

for ((i = 0; i < num; i++)); do
    while true; do
        read -p "Number $((i+1)): " number
        if [[ "$number" =~ ^-?[0-9]+$ ]]; then
            numbers+=("$number")
            break
        else
            echo "Invalid input. Please enter an integer."
        fi
    done
done


sum=0
for number in "${numbers[@]}"; do
    sum=$((sum + number))
done

if [ "$num" -ne 0 ]; then
    average=$((sum / num))
    echo "The average is: $average"
else
    echo "No numbers entered."
fi
