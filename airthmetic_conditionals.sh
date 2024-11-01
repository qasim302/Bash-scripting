#!/bin/bash

# Script Name: basic_arithmetic.sh
# Author: ghassan
# Date: 19/10/2024
# Description: well this  script will accepts two numbers from the user and performs basic
#              arithmetic operations: addition, subtraction, multiplication, and division.
#              It checks for valid numeric input and handles errors like division by zero.

# make function to check if the input is a valid number
function is_number() {
    if [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        return 0  #valid number
    else
        return 1  #invalid number
    fi
}

# Prompt the user for the first number
echo "Enter the first number:"
read num1

# validate the first number
if ! is_number "$num1"; then
    echo "Error: '$num1' is not a valid number. Please enter numeric values."
    exit 1
fi

# prompt the user for the second number
echo "Enter the second number:"
read num2

# Validate the second number
if ! is_number "$num2"; then
    echo "Error: '$num2' is not a valid number. Please enter numeric values."
    exit 1
fi

# Perform arithmetic operations
sum=$(echo "$num1 + $num2" | bc)
difference=$(echo "$num1 - $num2" | bc)
product=$(echo "$num1 * $num2" | bc)

# Check for division by zero
if [ "$num2" == "0" ]; then
    division="undefined (division by zero)"
else
    division=$(echo "scale=2; $num1 / $num2" | bc)
fi

# Display the results
echo "Results of basic arithmetic operations:"
echo "$num1 + $num2 = $sum"
echo "$num1 - $num2 = $difference"
echo "$num1 * $num2 = $product"
echo "$num1 / $num2 = $division"
