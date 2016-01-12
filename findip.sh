#!/bin/bash

echo "Enter a domain name?"
echo
read DOMAINNAME
echo
ping -c 1 $DOMAINNAME | grep "(" | awk '{ print $3 }' | cut -df -f3

