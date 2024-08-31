#!/bin/bash

DISK=$(df -hT|grep xfs)
THRESHOLD=5


while IFS= read -r line
do 
  USAUGE= echo $line|grep xfs|awk -F " " '{print $6F}'|cut -d "%" -f1
  PARTITON= echo $line|grep xfs|awk -F " " '{print $NF}'
  if [ $USAGE -ge $THRESHOLD ]
  then
  echo $PARTITON is greater than $THRESHOLD : current value :$USAGE , please check
  fi
done <<< $DISK