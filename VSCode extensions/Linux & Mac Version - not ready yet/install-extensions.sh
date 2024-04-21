#!/bin/bash

# Ensure the 'code' command is available
if ! command -v code &> /dev/null
then
    echo "VSCode CLI 'code' is not installed or not in PATH."
    exit 1
fi

# Install extensions from the list
echo "Starting to install extensions from extensions-linux.txt"
while IFS= read -r extension
do
  # Check if the extension ID seems valid (basic check for format 'publisher.extension')
  if [[ "$extension" =~ ^[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$ ]]; then
    echo "Installing/updating $extension"
    code --install-extension "$extension" --force
  else
    echo "Skipping invalid extension ID: $extension"
  fi
done < "extensions-linux.txt"

echo "All extensions have been installed or updated."
