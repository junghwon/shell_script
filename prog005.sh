#! /bin/sh

echo input1
read i1

echo input2
read i2

if [ $i1 = "0" -a $i2 = "1" ]; then
    echo "OK!"
else
    echo "NG!"
fi