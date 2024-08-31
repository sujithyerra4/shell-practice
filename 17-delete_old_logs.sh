#!/bin/bash

SOURCE_DIR=$1

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
echo -e "Directory $G exists $N"
else
echo -e "Directory not  $R exists $N"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo Files:$FILES

while IFS= read -r file
do
 echo "Deleting file:$file"
 rm -rf $FILES

done <<< $FILES

