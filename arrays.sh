#!/bin/bash

myclasses=(TCP/IP LINUX HARDWARE PHOTOSHOP BUSINESS\ ENGLISH)

echo ${myclasses[0]}
echo ${myclasses[1]}
echo ${myclasses[2]}
echo ${myclasses[3]}
echo ${myclasses[4]}
echo "-----------------------------------"
echo ${myclasses[*]}
unset myclasses[0]
echo ${myclasses[*]}
