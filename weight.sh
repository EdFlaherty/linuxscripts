#!/bin/bash
#Takes two parameters(arguments/input) and compares them.
currentweight="$1"
goalweight="$2"
difference=$[$currentweight-$goalweight]

if [ $difference -gt 0 ]
then
echo "You have $difference lbs to lose."
elif [ $difference -lt 0 ]
then
echo "You have $[$difference*(-1)] lbs to gain."
else
echo "You have met your goal!."
fi
