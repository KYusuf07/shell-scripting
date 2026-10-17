#!/bin/bash


echo "Please enter the marks"
read marks


if [ $marks -lt 36 ]; then
    echo "fail"

elif [ $marks -lt 50 ]; then
    echo "Third class"

elif [ $marks -lt 60 ]; then
    echo "Second class"

elif [ $marks -lt 75 ]; then
    echo "First class"

else 
    echo "Distinction"

fi