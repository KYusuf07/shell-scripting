#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "please run this script with sudo access.."
    exit 1;

fi

validate()



echo "proceeding..."
dnf install nginx -y


if [ $? -ne 0 ]; then
    echo "Nginx installation is failed"
    exit 1
else
    echo "Nginx installation is success"
fi        


dnf install mysql -y


if [ $? -ne 0 ]; then
    echo "mysql installation is failed"
    exit 1
else
    echo "mysql installation is success" 
fi         


dnf install redis -y


if [ $? -ne 0 ]; then
    echo "redis installation is failed"
    exit 1
else
    echo "redis installation is success" 
fi 

dnf install golang -y


if [ $? -ne 0 ]; then
    echo "goland installation is failed"
    exit 1
else
    echo "goland  installation is success" 
fi 


dnf install python3.14 python3.14-pip -y


if [ $? -ne 0 ]; then
    echo "python3 installation is failed"
    exit 1
else
    echo "python3  installation is success" 
fi 