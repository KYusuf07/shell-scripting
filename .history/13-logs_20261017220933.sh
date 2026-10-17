#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="$(logs_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "please run this script with sudo access.."
    exit 1
fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")"

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}.. Failed" | tee -a $logs_file
        exit 1
    else
        echo "${2}.. success" | tee -a $logs_file
    fi  
}

echo "proceeding..."
dnf install nginx -y &>> $logs_file
validate $? "Nginx Installation"

dnf install mysql -y &>> $logs_file
validate $? "mysql Installation"

dnf install golang -y &>> $logs_file
validate $? "goland Installation"

dnf install  python3 -y &>> $logs_file
validate $? "python Installation"

dnf install redis -y &>> $logs_file
validate $? "redis Installation"


echo "Script execution completed at ${date +"%F %T"}"