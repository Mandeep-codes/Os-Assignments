#!/bin/bash

today=$(date +%F)

for file in *.jpg
do
    mv "$file" "$today-$file"
done

echo "Files renamed successfully."
