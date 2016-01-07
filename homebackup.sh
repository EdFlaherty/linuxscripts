#!/bin/bash
#This script is used to backup the user's home directory.

cd /home
tar -cf /var/tmp/homebackup.tar $USER

rm /var/tmp/homebackup.tar.gz > /dev/null

gzip /var/tmp/homebackup.tar

scp /var/tmp/homebackup.tar.gz administrator@10.1.10.73:~

echo "Job completed."
echo
