#!/bin/bash

# 获取当前日期
backup_date=$(date +%Y-%m-%d)

# 设置备份文件名
backup_file="/opt/etc_backup_$backup_date.tar.gz"

# 创建备份
tar -zcvf "$backup_file" /etc/ 2> /dev/null

# 统计备份文件数量并保留最新的7个备份
backup_count=$(ls -t /opt/etc_backup_*.tar.gz 2>/dev/null | wc -l)
if [ "$backup_count" -gt 7 ]; then
    old_backups=$(ls -t /opt/etc_backup_*.tar.gz 2>/dev/null | tail -n +8)
    rm $old_backups 2> /dev/null
fi
