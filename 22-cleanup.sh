#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
days=${2:-14} # if user is not passing days, we will take 14 days as default

usage(){
    echo -e "${R}USAGE:: $0 [SOURCE_DIR] [days(Optional, default to 14 days)]${N}"
    exit 1
}

if [ -z "$source_dir" ]; then
    echo "ERROR:: Missing parameters"
    usage
fi

if [ ! -d "$source_dir" ]; then
    echo -e "${R}ERROR:: $source_dir does not exist${N}"
fi

echo "Scanning files older than $days in $source_dir"
files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +$days)

: '
if [ -z "$files_to_delete" ]; then
    echo "No log files found older than $days"
    exit 0
fi
'

while IFS= read -r line
do
    echo "File is going to be deleted: $line"
    rm -f $line
    echo "File deleted: $line"
done <<< "$files_to_delete"

# < -> for file inputs
# <<< -> variable as input


# --- NEW CODE ADDED HERE ---

# 1. Print the full list of files to the screen in yellow
echo -e "${Y}The following files will be permanently deleted:${N}"
echo "$files_to_delete"
echo "--------------------------------------------------"

# 2. Ask the user for confirmation before proceeding
read -p "Are you sure you want to delete these files? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Deletion cancelled. No files were deleted."
    exit 0
fi
# ---------------------------

while IFS= read -r line
do
    echo "File is going to be deleted: $line"
    rm -f "$line"
    echo -e "${G}File deleted: $line${N}"
done <<< "$files_to_delete"