#!/bin/bash

outputFile="VSCode-Extensions-With-Urls.txt"

if [ -f "$outputFile" ]; then
    > $outputFile
else
    touch $outputFile
fi

extensions=$(code --list-extensions)

for ext in $extensions; do
    extensionName=${ext#*.}

    title=$(echo $extensionName | sed -e 's/-/ /g' | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1')

    url="https://marketplace.visualstudio.com/items?itemName=$ext"

    echo "$title" >> $outputFile
    echo "$url" >> $outputFile
    echo "" >> $outputFile
done

echo "Export completed. Check the $outputFile file."


-------------------

