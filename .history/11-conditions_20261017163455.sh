#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0]; then
    echo "please run this script with sudo access.."
    