#!/bin/bash
#This script is used to backup the user's home directory.

#echo "Availiable home folders:"
#ls /home
#echo
#echo "Which home foler would you like to backup?:"
#read HOMEFOLDER
#echo
####################################################
#Configuration Variables.
####################################################
HOMEFOLDER="ed"
BACKUPDIR=/home
TIMESTAMP=$(date | awk '{ print $1"_"$2"_"$3"_"$6 }')
TARFILENAME="/var/tmp/$TIMESTAMP.$HOMEFOLDER.tar"
GZIPFILENAME="$TARFILENAME.gz"
REMOTESERVER="10.1.10.73"
REMOTEUSER="administrator"
REMOTEDIR="~"
LOGFILE="/var/tmp/homebackuplog.txt"
DELDATE=$(date -d "15 day ago" '+%a_%b_%d_%Y')
DELTARFILE="$DELDATE.$HOMEFOLDER.tar"
DELGZIPFILE="$DELTARFILE.gz"
####################################################

cd $BACKUPDIR

if [ -f $TARFILENAME ]
then
rm $TARFILENAME
fi

tar -cf $TARFILENAME $HOMEFOLDER

if [ -f $GZIPFILENAME ]
then
rm $GZIPFILENAME
fi

gzip $TARFILENAME

sshpass -p "southhills#" scp $GZIPFILENAME $REMOTEUSER@$REMOTESERVER:$REMOTEDIR

date >> $LOGFILE
echo "Backup complete."

cd /var/tmp
rm $DELGZIPFILE
echo "Backups 15 days ago have been removed."
