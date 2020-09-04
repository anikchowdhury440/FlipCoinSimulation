#!/bin/bash -x

count_head=0
count_tail=0

function getCoinFlipResult() {
        echo $(( RANDOM%2 ))
}

function getWinner() {
        head_count=$1
        tail_count=$2
        if [ $head_count -gt $tail_count ]
        then
                difference=$(( $head_count-$tail_count ))
                echo "Head Wins! Head wins $difference times more than Tail"
        else
                difference=$(( $tail_count-$head_count ))
                echo "Tail Wins! Tail Wins $difference times more than Head"
        fi
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
	getWinner $count_head $count_tail
else
        echo "It's a tie"
	echo "Tie Breaker starts Head or Tail wins if there is a difference of minimum 2 is achieved"
        while [[ $(( $count_head-$count_tail )) -ne 2 && $(( $count_tail-$count_head )) -ne 2 ]]
        do
                coin_flip_result="$( getCoinFlipResult )"
                if [[ $coin_flip_result -eq 0 ]]
                then
                        ((count_head++))
                else
			((count_tail++))
                fi
        done
        getWinner $count_head $count_tail
fi

