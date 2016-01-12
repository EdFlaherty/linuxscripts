#!/bin/bash
#This script is used to backup the user's home directory.

echo "Availiable home folders:"
ls /home
echo
echo "Which home foler would you like to backup?:"
read HOMEFOLDER
echo

BACKUPDIR=/home
TIMESTAMP=$(date | awk '{ print $1"_"$2"_"$3"_"$6 }')
TARFILENAME="/var/tmp/$TIMESTAMP.$HOMEFOLDER.tar"
GZIPFILENAME="$TARFILENAME.gz"
REMOTESERVER="10.1.10.73"
REMOTEUSER="administrator"
REMOTEDIR="~"
LOGFILE="/var/tmp/homebackuplog.txt"


cd $BACKUPDIR
tar -cf $TARFILENAME $HOMEFOLDER
gzip $TARFILENAME

rsync $GZIPFILENAME $REMOTEUSER@$REMOTESERVER:$REMOTEDIR

date >> $LOGFILE
echo "Backup complete."
