#!/bin/bash

echo "Guess a number between 1 and 7:"

read number

while [ $number != "q" ]
do
case $number in

 1) echo "Red"    ;;   5) echo "Blue"   ;;
            
 2) echo "Orange" ;;   6) echo "Indigo" ;;

 3) echo "Yellow" ;;   7) echo "Violet" ;;
   
 4) echo "Green"  ;;   *) echo "That is not a valid number." ;;

esac
echo "Choose another number:"
read number
done
