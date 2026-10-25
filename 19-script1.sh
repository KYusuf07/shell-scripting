#!/bin/bash

# You MUST use export here so the child process can access it
export present_country="India"

echo "I am in: $present_country"
echo "PID of $0: $$"

# Run as a new process instead of using 'source'
source ./20-script2.sh