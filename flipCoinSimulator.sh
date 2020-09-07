#!/bin/bash -x

count_head=0
count_tail=0

read -p "Enter the number of times do you want to flip: " n

function getCoinFlipResult() {
        echo $(( RANDOM%2 ))
}

for (( i=1;i<=n;i++ ))
do
        coin_flip_result="$( getCoinFlipResult )"
	if [[ $coin_flip_result -eq 0 ]]
	then
		((count_head++))
	else
		((count_tail++))
	fi
done

echo "Number of times Head won: " $count_head
echo "Number of times Tail won: " $count_tail
