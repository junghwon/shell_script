#! /bin/bash

#for ((i=1; i<5; i++))	# bash では C言語風のforが使える
#for i in {1..5}		# bash では{1..5}が展開される
for i in $(seq 1 5)		# ash でも動作する
do
	echo $i
done
