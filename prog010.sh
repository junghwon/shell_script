#! /bin/bash

#for ((i=1; i<5; i++))	# bash では C言語風の for 文が使えます
#for i in {1..5}			# bash では {1..5} が展開されます
for i in $(seq 1 5)		# ash でも動作します
do
	echo $i
done
