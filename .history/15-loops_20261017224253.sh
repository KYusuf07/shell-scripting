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