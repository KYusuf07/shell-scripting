#!/bin/bash

echo "I am in: $present_country"
# We use basename to strip path characters from BASH_SOURCE
echo "PID of $(basename "${BASH_SOURCE[0]}"): $$"