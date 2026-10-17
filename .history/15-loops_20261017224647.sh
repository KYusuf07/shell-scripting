#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="${logs_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "please run this script with sudo access.."
    exit 1
fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")" &>> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}.. Failed" | tee -a $logs_file
        exit 1
    else
        echo "${2}.. success" | tee -a $logs_file
    fi  
}


for package in $@
do
    echo "Going to Install: ${package}"
    dnf install $package -u &>> $logs_file
done    