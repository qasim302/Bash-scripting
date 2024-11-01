#!/bin/bash

# Script name: animal_fun_facts.sh
# Author: ghassan
# Date: 18/10/2024
# Description: this script prompts the user for their name, age, and favorite animal.
#              It checks if the user is old enough to drive and provides a fun fact about their favorite animal.

# function to display fun facts about animals
function fun_fact() {
    case $1 in
        lion)
            echo "Fun Fact: A lion roar can be heard from as far as 5 miles away!"
            ;;
        rabbit)
            echo "Fun Fact: Rabbits are social animals that can purr when they're happy, just like cats!"
            ;;
        dog)
            echo "Fun Fact: dogs are humans friendly and favorite animal and they have sense of time."
            ;;
        cat)
            echo "Fun Fact: Cats can rotate their ears 180 degrees and can hear high-frequency sounds humans can't!"
            ;;
        elephant)
            echo "Fun Fact: Elephants are the only mammals that cannot  jump!"
            ;;
       
        *)
            echo "I don't have a fun fact about that animal. Sorry!"
            ;;
    esac
}

# Prompt user for their name
echo "What is your name?"
read name

# Greet the user
echo "Hello Mr. $name!"

# Prompt user for their age
echo "what is your age ?"
read age

# Check if the user is old enough to drive
if [ $age -ge 16 ]; then
    echo "You are old enough to drive!"
else
    echo "You are not old enough to drive yet!"
fi

# List of predefined animals
echo "Choose your favorite animal from the following list: lion,rabbit,dog, cat, elephant "
echo "Please enter your favorite animal:"
read animal

# Display a fun fact about the selected animal
fun_fact "$animal"
