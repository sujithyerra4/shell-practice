#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "please proceed with root privilages"
exit 1
fi

VALIDATE(){

  if [ $1 -ne 0 ]
   then
   echo "$2  installion is failure"
   else
   echo "$2 installion is success"
   fi

}


dnf list installed git 

if [ $? -ne 0 ]
then
  echo "git is not installed, going to install it" 
   dnf install git -y
   VALIDATE $? git
   else
    echo "git is already installed"
   fi

   
 dnf list installed nginx

 if [ $? -ne 0 ]
 then 
  echo "Nginx is not installed, going to install it"
     dnf install nginx
   VALIDATE $? nginx
else
 echo "Nginx is already installed"
 fi