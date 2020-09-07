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
        if [[ ( $count_head -eq 21 || $count_tail -eq 21 ) ]]
        then
                break
        fi
done

if [ $count_head -ne $count_tail ]
then
        echo "It's a win"
        if [ $count_head -gt $count_tail ]
        then
		echo "Head Count: " $count_head
        	echo "Tail Count: " $count_tail
                difference=$(( $count_head-$count_tail ))
                echo "Head Wins! Head wins $difference times more than Tail"
        else
		echo "Head Count: " $count_head
        	echo "Tail Count: " $count_tail
                difference=$(( $count_tail-$count_head ))
                echo "Tail Wins! Tail Wins $difference times more than Head"
        fi
else
        echo "It's a tie"
	echo "Head Count: " $count_head
        echo "Tail Count: " $count_tail
fi
