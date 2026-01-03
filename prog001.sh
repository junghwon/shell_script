#! /bin/bash

echo 1+1=
read ansewer

if [ $ansewer = "2" ]; then
    echo "OK"
else
    echo "NO"
fi