#!/bin/bash -x

count_head=0
count_tail=0

function getCoinFlipResult() {
        echo $(( RANDOM%2 ))
}

while [[ $count_head -lt 21 && $count_tail -lt 21 ]]
do
        coin_flip_result="$( getCoinFlipResult )"
	if [[ $coin_flip_result -eq 0 ]]
	then
		((count_head++))
	else
		((count_tail++))
	fi
done

if [ $count_head -ne $count_tail ]
then
        echo "It's a win"
        if [ $count_head -gt $count_tail ]
        then
                difference=$(( $count_head-$count_tail ))
                echo "Head Wins! Head wins $difference times more than Tail"
        else
                difference=$(( $count_tail-$count_head ))
                echo "Tail Wins! Tail Wins $difference times more than Head"
        fi
else
        echo "It's a tie"
fi
