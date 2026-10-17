#!/bin/bash

user_id=$(id -u)
logs_folder="/var/logs

if [ $user_id -ne 0 ]; then
    echo "please run this script with sudo access.."
    exit 1;

fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}.. Failed"
        exit 1
    else
        echo "${2}.. success"
    fi  
}

echo "proceeding..."
dnf install nginx -y
validate $? "Nginx Installation"

dnf install mysql -y
validate $? "mysql Installation"

dnf install golang -y
validate $? "goland Installation"

dnf install  python3 -y
validate $? "python Installation"

dnf install redis -y
validate $? "redis Installation"


echo "Still Proceeded..."


