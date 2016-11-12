#!/bin/sh

if [ "$1" -gt "$2" ]
then
    echo "一番目の引数が二番目の引数より大きい"
elif [ "$1" -eq "$2" ]
then
    echo "一番目の引数と二番目の引数は同じ"
else
    echo "一番目の引数は二番目の引数より小さい"
fi

