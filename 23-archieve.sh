#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
dest_dir=$2
days=${3:-14} # if user is not passing days, we will take 14 days as default

usage(){
    echo -e "${R}USAGE:: $0 [SOURCE_DIR] [DEST_DIR] [days(Optional, default to 14 days)]${N}"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
    echo -e "${R}ERROR:: Either source or destination directory is missing${N}"
    usage
fi

if [ ! -d "$source_dir" ]; then
    echo -e "${R}ERROR:: Source Directory: $source_dir does not exist${N}"
    exit 1
fi

# Safety check for the restricted destination directory
if [ ! -d "$dest_dir" ]; then
    echo -e "${R}ERROR:: Destination Directory: $dest_dir does not exist.${N}"
    echo -e "${Y}Please create it first using: sudo mkdir -p $dest_dir && sudo chown ec2-user:ec2-user $dest_dir${N}"
    exit 1
fi

echo -e "${Y}Scanning files older than $days days in $source_dir...${N}"
files_to_archive=$(find "$source_dir" -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_archive" ]; then
    echo -e "${G}No log files found older than $days days${N}"
    exit 0
fi

timestamp=$(date +%Y-%m-%d-%H-%M-%S)
file_name="$dest_dir/logs-$timestamp.tar.gz"

# Archiving the files safely
tar -czf "$file_name" $files_to_archive

if [ $? -ne 0 ]; then
    echo -e "${R}ERROR:: Logs archival failed${N}"
    exit 1
else
    echo -e "${G}Logs successfully archived: $file_name${N}"
    
    # Deleting the original files only after successful backup
    while IFS= read -r line
    do
        rm -f "$line"
        echo "Original file deleted: $line"
    done <<< "$files_to_archive"
fi