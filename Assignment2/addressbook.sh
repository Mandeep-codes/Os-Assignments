#!/bin/bash

file="addressbook.txt"

while true
do
    echo "1. Create Address Book"
    echo "2. View Address Book"
    echo "3. Insert a Record"
    echo "4. Delete a Record"
    echo "5. Modify a Record"
    echo "6. Exit"
    echo "Enter choice:"
    read choice

    case $choice in
        1)
            touch $file
            echo "Address Book Created."
            ;;
        2)
            cat $file
            ;;
        3)
            echo "Enter Name:"
            read name
            echo "Enter Phone:"
            read phone
            echo "$name $phone" >> $file
            ;;
        4)
            echo "Enter Name to Delete:"
            read name
            grep -v "$name" $file > temp.txt
            mv temp.txt $file
            ;;
        5)
            echo "Enter Name to Modify:"
            read name
            grep -v "$name" $file > temp.txt
            echo "Enter New Phone:"
            read phone
            echo "$name $phone" >> temp.txt
            mv temp.txt $file
            ;;
        6)
            exit
            ;;
        *)
            echo "Invalid Choice"
            ;;
    esac
done
