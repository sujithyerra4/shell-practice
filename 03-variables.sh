#!/bin/bash

PERSON1=$1
PERSON2=$2

echo "$PERSON1:hii $PERSON2 ,how are you?"
echo "$PERSON2:Hii $PERSON1 , i am fine,what about you?"
echo "$PERSON1:i am fine,what you doing these days"
echo "$PERSON2:i am learning shell scripting"

echo "All variables passed to the script: $@ "
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Current working directory:$PWD "
echo "Home directory of current user:$HOME "
echo "PID of the script executing now: $$"
sleep 100 &
echo "PID of last background command:$!"