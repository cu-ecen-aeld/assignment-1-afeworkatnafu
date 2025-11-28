#!/bin/bash
#Get the two arguments from command line
FILE_PATH=$1
WRITE_STRING=$2

#Check for valid arguments
if [ -z "$1" ] || [ -z "$2" ];
then
   echo "ERROR: File path or write string argument is missing."
   echo "Usage: $0 <FILE_PATH> <WRITE_STRING>"
   exit 1
else
   echo "Success: Expected arguments are present" > /dev/null
fi

# Get file directory from file path
FILE_DIR=$(dirname "$FILE_PATH")

# Create the directory path if it doesn't exist
# Use -p flag prevents error if directory already exists
mkdir -p "$FILE_DIR"  

# Write/overwrite the content on the file
# The redirection (>) creates the file if it doesn't exist.
echo "$WRITE_STRING" > "$FILE_PATH"

# Check the exit status of the previous command ($?)
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create or write to file: $FILE_PATH" >&2
    exit 1
fi

#Success (optional exit 0)
echo "Successfully wrote to $FILE_PATH"
exit 0

