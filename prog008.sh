#! /bin/sh

cnt=0

until [ $cnt -eq 10 ]
do
	cnt=$(($cnt + 1))
	echo $cnt
done

