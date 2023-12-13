#!/bin/bash
# read -p "请输入你的时间"
read -p "请输入你要插入的完整规则" new_crotab
echo "${new_crotab}" >> /var/spool/cron/root 
echo "当前计划任务是:"
echo ${new_crotab}


