#!/bin/bash

ls *.sh > myforlist

for i in `cat myforlist`
do
cp "$i" "$i".backup
done
