#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "please proceed with root privilages"
exit 1
fi

VALIDATE(){

  if [ $1 -ne 0 ]
   then
   echo -e "$2  installion is $R failure $N"
   else
   echo -e "$2 installion is $G success $N"
   fi
}


dnf list installed git 

if [ $? -ne 0 ]
then
  echo "git is not installed, going to install it" 
   dnf install git -y
   VALIDATE $? git
   else
    echo -e "git is already $Y installed $N"
   fi

   
 dnf list installed nginx

 if [ $? -ne 0 ]
 then 
  echo "Nginx is not installed, going to install it"
     dnf install nginx -y
   VALIDATE $? nginx
else
 echo -e "Nginx is already $Y installed $N"
 fi