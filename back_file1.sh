#!/bin/bash
while true; do
    day=$(date +%u)
    time=$(date +%H)
    if [ "$day" -eq 5 ] && [ "$time" -eq 15] ;then
      cp_time=$(date +"%Y-%m-%d")

cp_time=$(date +"%Y-%m-%d")
back_file="/opt/etc_back_$cp_time.tar.gz"
tar -zcvf "$back_file" /etc/ 2> /dev/null

back_file1="`ls -t /opt/etc_backup_*.tar.gz 2>/dev/null | wc -l`"
      if [ "$back_file1" -gt 7 ]
      then
        read_backup=$( ls -t /opt/etc_backup_*.tar.gz 2> dev/nul|tail -n rm $read_backup 2> /dev/null)
      fi
      sleep 1h
else
  sellp 5m
  fi
done