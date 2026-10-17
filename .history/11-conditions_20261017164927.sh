#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "please run this script with sudo access.."
    exit 1;

fi

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


dnf install mysql -y


if [ $? -ne 0 ]; then
    echo "mysql installation is failed"
    exit 1
else
    echo "mysql installation is success" 
fi 