#!/bin/bash

#ifconfig eth0 - Gets ip info from interface eth0.
#grep "inet addr:" - Filters output to just IPv4 address line.
#awk '{ print $2 }' - Filter only column two.
#cut -d: -f2 - Uses : as delimiter and prints second column of data.

echo "Availiable Interfaces."
ifconfig | grep "eth"
ifconfig | grep "wlan"
echo
echo "Enter the interface you would like?"
read INTERFACENAME
echo

ifconfig $INTERFACENAME | grep "inet addr:" | awk '{ print $2 }' | cut -d: -f2
echo
