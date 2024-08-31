#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){

    echo " $R USAGE $N :sudo sh.14-usage.sh git nginx mysql...."
    exit 1
}



USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
# echo "please proceed with root privilages"
USAGE
exit 1
fi

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
