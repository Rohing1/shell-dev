#!/bin/bash

while true; do
    # 获取当前时间的星期几和小时数
    current_day=$(date +%u)
    current_hour=$(date +%H)

    # 如果是星期五（星期五的数字为5），并且是下午3点，则执行备份
    if [ "$current_day" -eq 5 ] && [ "$current_hour" -eq 15 ]; then
        # 获取当前日期
        backup_date=$(date +%Y-%m-%d)

        # 设置备份文件名
        backup_file="/opt/etc_backup_$backup_date.tar.gz"

        # 创建备份
        tar -zcvf "$backup_file" /etc/

        # 统计备份文件数量并保留最新的7个备份
        backup_count=$(ls -t /opt/etc_backup_*.tar.gz 2>/dev/null | wc -l)
        if [ "$backup_count" -gt 7 ]; then
            old_backups=$(ls -t /opt/etc_backup_*.tar.gz 2>/dev/null | tail -n +8)
            rm $old_backups 2>/dev/null
        fi

        # 暂停循环，直到下次执行时间
        sleep 1h
    else
        # 如果不是星期五下午3点，则等待一段时间后再次检查
        sleep 5m
    fi
done
