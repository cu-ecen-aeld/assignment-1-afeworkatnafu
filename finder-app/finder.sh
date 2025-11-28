#!/bin/bash

SEARCH_DIRECTORY=$1
SEARCH_STRING=$2

#check for valid arguments
if [ -z "$1" ] || [ -z "$2" ];
then
   echo "ERROR: Directory or search string argument is missing."
   echo "Usage: $0 <SEARCH_DIRECTORY> <SEARCH_STRING>"
   exit 1
else
   echo "Success: Expected arguments are present" > /dev/null
fi
   
#Check if the directory is valid and exists   
if [ -d "$SEARCH_DIRECTORY" ]
then
    echo "Success: $SEARCH_DIRECTORY is an existing directory" > /dev/null
else
   echo "$SEARCH_DIRECTORY directory does not exist"
   exit 1
fi


#Print a message "The number of files are X and the number of matching lines are Y".
# Calculate X (Total number of regular files in the directory and subdirectories)
TOTAL_FILES=$(find "$SEARCH_DIRECTORY" -type f | wc -l)

# Recursively search and calculate total number of matching lines found across all files.
TOTAL_MATCHES=$(grep -r "$SEARCH_STRING" "$SEARCH_DIRECTORY" 2>/dev/null | wc -l)

echo "The number of files are $TOTAL_FILES and the number of matching lines are $TOTAL_MATCHES"
exit 0

