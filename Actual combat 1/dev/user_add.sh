#!/bin/bash
read -p "pleas is import login ：" user

read -p "pleas is import passwd ：" pad
useradd ${user}
echo "${user}" | passwd --stdin ${user} >/dev/null 2>&1 
echo "${user}:${pad}" >>/tmp/user_add.log

