#!/bin/bash

echo "Enter the IP address you would like information about:"

read IPADDRESS

ping -c 1 $IPADDRESS > /dev/null

IPNUM=$(ping -c 1 $IPADDRESS | grep "(" | awk '{ print $3 }' | cut -d. -f1,2)
IPNUM=$(echo $IPNUM | cut -c 2- | cut -df -f1)
IPFIRST=$(ping -c 1 $IPADDRESS | grep "(" | awk '{ print $3 }' | cut -d. -f1)
IPFIRST=$(echo $IPFIRST | cut -c 2- | cut -df -f1)
IPSECOND=$(ping -c 1 $IPADDRESS | grep "(" | awk '{ print $3 }' | cut -d. -f2)

if [ $(ping -c 1 $IPADDRESS | grep "transmitted" | awk '{ print $4 }') -eq 1 ]
then
echo "There was a response from that IP address."
else
echo "There was no response from that IP address."
fi

if [ $IPFIRST -eq 172 -a $IPSECOND -ge 16 -a $IPSECOND -le 31 ] || [ $IPFIRST -eq 10 ] || [ $IPFIRST -eq 192 -a $IPSECOND -eq 168 ]
then
echo "This is a private IP address."
else
echo "This is a public IP address."
fi

case $IPNUM in
 169.254)
   echo "This is an APIPA address."
   ;;
 127.*)
   echo "This is a Loopback address."
   ;;
 *)
   echo "This is not an APIPA or Loopback address."
   ;;
esac

case 1 in
 $(($IPFIRST <= 126)))
   echo "This is an A class address."
   ;;
 $(($IPFIRST == 127)))
   ;;
 $(($IPFIRST <= 191)))
   echo "This is a B class address."
   ;;
 $(($IPFIRST <= 223)))
   echo "This is a C class address."
   ;;
esac
