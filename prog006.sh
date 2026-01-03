#! /bin/sh

read input1

case $input1 in
    yes )
        echo "You selected yes."
        ;;
    no )
        echo "You selected no."
        ;;
    * )
        echo "Invalid input."
        ;;
esac