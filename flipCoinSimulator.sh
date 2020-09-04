#!/bin/bash -x

coin_flip_result=$(( RANDOM%2 ))

if [[ $coin_flip_result -eq 0 ]]
then
        echo "Head"
else
        echo "Tail"
fi
