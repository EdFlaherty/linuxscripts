#!/bin/bash

echo "Guess a number between 1 and 7:"

read number

while [ $number != "q" ]
do
case $number in
 1)
    echo "Red"
    ;;
 2)
    echo "Orange"
    ;;
 3)
    echo "Yellow"
    ;;
 4)
    echo "Green"
    ;;
 5)
    echo "Blue"
    ;;
 6)
    echo "Indigo"
    ;;
 7)
    echo "Violet"
    ;;
 *)
    echo "That is not a valid number."
    ;;
esac
echo "Choose another number:"
read number
done
