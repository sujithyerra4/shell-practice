#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "please proceed with root privilages"
 exit 1
 fi

 dnf list installed nginx

 if [ $? -ne 0 ]
 then 
  echo "Nginx is not installed, going to install it"
     dnf install nginx
   if [ $? -ne 0 ]
   then
   echo "nginx  installion is failure"
   else
   echo "nginx installion is success"
   fi
else
 echo "Nginx is already installed"
 fi

dnf list installed git

 if [ $? -ne 0 ]
 then 
  echo "git is not installed, going to install it"
     dnf install git -y
   if [ $? -ne 0 ]
   then
   echo "git  installion is failure"
   else
   echo "git installion is success"
   fi
else
 echo "git is already installed"

#  if [ $? -eq 0 ]
#  then 
#     dnf remove git 
#     echo " git is uninstalled"
# fi 

 fi

