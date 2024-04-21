#!/bin/bash

# Define the file containing the list of extensions
input_file="extensions-linux.txt"

# Check if the 'code' command is available
if ! command -v code &> /dev/null
then
    echo "VSCode CLI 'code' is not installed or not in PATH."
    exit 1
fi

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file $input_file does not exist."
    exit 1
fi

# Read each extension ID from the file and install it
echo "Starting to install extensions from $input_file..."
while IFS= read -r extension
do
  echo "Installing $extension..."
  code --install-extension "$extension" --force
done < "$input_file"

echo "All extensions have been installed."
