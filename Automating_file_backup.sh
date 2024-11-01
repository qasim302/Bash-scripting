#!/bin/bash

# Script Name: backup_script.sh
# Author: ghassan
# Date: 18/10/2024
# Description: This script takes a directory as input and creates a timestamped backup of it.
#              It checks for the directory's existence, handles errors, and provides feedback.

# Prompt the user to enter the name of direcctory for backup
echo "Please enter the full path of the directory you want to back up:"
read dir_to_backup

# Checking if the directory exists
if [ ! -d "$dir_to_backup" ]; then
    echo "Error: The directory name you enter :'$dir_to_backup' does not exist."
    exit 1
fi

# Creating a backup directory if it doesn't exist
backup_dir="$HOME/backups"
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
    echo "Backup directory created at: $backup_dir"
fi

# Get the current date and time for timestamping the backup file
timestamp=$(date +'%Y-%m-%d_%H-%M-%S')

# Create the backup file with a timestamp
backup_file="$backup_dir/backup_$(basename "$dir_to_backup")_$timestamp.tar.gz"

# Archive the directory
echo "Creating a backup of '$dir_to_backup'..."
tar -czf "$backup_file" -C "$dir_to_backup" .

# Check if the tar command was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully! The backup file is located at: $backup_file"
else
    echo "Error: There was an issue creating the backup."
    exit 1
fi
