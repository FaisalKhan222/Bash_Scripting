#!/bin/bash

# guessing the number game in bash.
# Usage: ./guess.sh

show_help() {
    echo "Usage: ./guess_game.sh [option]"
    echo ""
    echo "This is a number guessing game where you try to guess a number between 1 and 100."
    echo ""
    echo "Options:"
    echo "  --help       Show this help message and exit."
    echo "  --start      Start the guessing game."
    exit 1
}


if [[ "$1" == "--help" ]]; then
    show_help
fi

#generate random number between 1-100 inclusive.
random_number=$((RANDOM % 100 + 1))

let guess=0
let attempts=0

echo "This is a guessing the number game [1-100]"
echo "Try to guess the number. Type 'exit' to quit the game anytime."


while true; do
    read -p "Guess the number> " guess

    if [[ "$guess" == "exit" ]]; then
        echo "You chose to exit the game. The random number was $random_number."
        exit 0
    fi

    if [[ -z "$guess" ]]; then
        echo "Please enter a number between 1 and 100."
        continue
    elif ! [[ "$guess" =~ ^[0-9]+$ ]] || [ "$guess" -lt 1 ] || [ "$guess" -gt 100 ]; then
        echo "Please enter a valid number between 1 and 100."
        continue
    fi

    ((attempts++))

    if [ "$guess" -lt "$random_number" ]; then
        echo "Your guess is low"
    elif [ "$guess" -gt "$random_number" ]; then
        echo "Your guess is high"
    else
        echo "Congrats!! You have guessed the number right!!"
        echo "The random number is indeed $random_number"
        break
    fi
done

echo "It took you $attempts attempts to guess the number."