#!/bin/bash

read -p "请输入crotab的时间频率" cro_time
read -p "请输入crotab的具体命令"  cro_job
echo "#crontab by rohing at $(date +%F)" >>/var/spool/cron/root
echo "$cro_time $cro_job" >>/var/spool/crotab/cron/root
echo -e "当前最新的计划任务是:\n$(crontab -l)"

