#!/bin/bash

while IFS= read -r extension
do
  code --install-extension "$extension"
done < "extensions.txt"

echo "All extensions have been installed."
