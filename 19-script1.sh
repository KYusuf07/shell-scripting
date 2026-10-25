#!/bin/bash
export present_country="India"

echo "I am in: $present_country"
# We use basename to strip path characters from $0
echo "PID of $(basename "$0"): $$"

# You MUST include ./ so Linux knows to look in the current folder
source ./20-script2.sh