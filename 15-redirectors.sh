#!/bin/bash

/var/log/shell-practice/15-redirectors-<timestamp>.log

LOG_FOLDER=/var/log/shell-practice
SCRIPT_NAME=echo $0 | awk -F "." '{print $1}'
TIME_STAMP= $(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=  $LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log 
mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
 echo "please proceed with root privilages"
fi
USAGE(){

    echo -e " $R USAGE $N :sudo sh.14-usage.sh package1  package2 package3...."
    exit 1
}

if [ $# -eq 0 ]
then
 USAGE
 fi
echo "script started executing at : $(date)"
VALIDATE(){

  if [ $1 -ne 0 ]
   then
   echo -e "$2 is $R failure $N"
   exit1
   else
   echo -e "$2 is $G success $N"
   fi
}

for package in $@
do 
    dnf list installed $package 

if [ $? -ne 0 ]
then
  echo "$package  is not installed, going to install it" 
   dnf install $package  -y
   VALIDATE $? "Installing  $package "
   else
    echo -e "$package  is already $Y installed $N"
   fi

done
