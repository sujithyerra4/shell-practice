#!/bin/bash



LOG_FOLDER=/var/log/shell-practice
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log 
mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
 echo -e $R please proceed with root privilages $N | tee -a $LOG_FILE
fi
USAGE(){

    echo -e " $R USAGE $N :sudo sh.14-usage.sh package1  package2 package3...." | tee -a $LOG_FILE
    exit 1
}

if [ $# -eq 0 ]
then
 USAGE
 fi

echo script started executing at : $(date) | tee -a $LOG_FILE

VALIDATE(){

  if [ $1 -ne 0 ]
   then
   echo -e "$2 is $R failure $N" | tee -a $LOG_FILE
   exit1
   else
   echo -e "$2 is $G success $N" | tee -a $LOG_FILE
   fi
}

for package in $@
do 
    dnf list installed $package &>> $LOG_FILE

if [ $? -ne 0 ]
then
  echo "$package  is not installed, going to install it" | tee -a $LOG_FILE
   dnf install $package  -y  &>> $LOG_FILE
   VALIDATE $? "Installing  $package "
   else
    echo -e "$package  is already $Y installed $N" | tee -a $LOG_FILE
   fi

done
