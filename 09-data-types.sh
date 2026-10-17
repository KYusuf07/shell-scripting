#!/bin/bash

var1=10
var2=20
var3=yusuf


echo "$var1+$var2"
echo "$(($var1+$var2+$var3))"


declare -i COUNT=5 # Iam declaring as integer
COUNT=COUNT+1

echo "Count is: $COUNT"

FRUITS=("Apple" "Banana" "Mango")
echo "ALL Fruits: ${FRUITS[@]}"
echo "First Fruit: ${FRUITS[1]}"      


name="Yusuf Ka"

echo "$(name)tike"