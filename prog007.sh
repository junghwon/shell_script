#! /bin/sh

cnt=0

while [ $cnt -lt 10 ]
do
    cnt=`expr $cnt + 1`
    echo $cnt
done