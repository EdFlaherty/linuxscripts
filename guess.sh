#!/bin/bash

echo "Guess a number between 1 and 7:"

read number

while [ $number != "q" ]
do
case $number in
 1)
    echo "Red"
    firefox https://en.wikipedia.org/wiki/Red &
    ;;
 2)
    echo "Orange"
    firefox https://en.wikipedia.org/wiki/Orange &
    ;;
 3)
    echo "Yellow"
    firefox https://en.wikipedia.org/wiki/Yellow &
    ;;
 4)
    echo "Green"
    firefox https://en.wikipedia.org/wiki/Green &
    ;;
 5)
    echo "Blue"
    firefox https://en.wikipedia.org/wiki/Blue &
    ;;
 6)
    echo "Indigo"
    firefox https://en.wikipedia.org/wiki/Indigo &
    ;;
 7)
    echo "Violet"
    firefox https://en.wikipedia.org/wiki/Violet &
    ;;
 *)
    echo "That is not a valid number."
    ;;
esac
echo "Choose another number:"
read number
done
