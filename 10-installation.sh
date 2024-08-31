#!/bin/bash

id=0

if [ $? -ne 0 ]
then
 echo "please proceed with root privilages"
 exit 1
 fi

 dnf lit installed nginx

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
