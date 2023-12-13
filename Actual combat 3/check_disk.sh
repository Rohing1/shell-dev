#!/bin/bash
#用途：按下数字查看硬盘的资源，
#Author:rohing
#History:20231212 Version:1.0
#check_disk="df -h |awk '/\/$/{print $5*1}'"
check_disk=`echo $(df -h |awk '/\/$/{print $5 *1}')`
check1_disk(){
if [ "$check_disk" -gt 90 ]
then
    echo "硬盘资源，已经超90以上，请清理磁盘"
    echo "$webhook告警信息"
fi
}
check2_disk(){
if [ "$check_disk" -gt 85 ]
then
    echo "硬盘资源，已经超85了，请清理磁盘"
    echo "$webhook告警信息"
fi
}
check3_disk(){
if [ "$check_disk" -gt 70 ]
then
    echo "硬盘资源，已经超70了，请清理磁盘"
    echo "$webhook告警信息"
fi
}
check4_disk(){
if [ "$check_disk" -lt 30 ]
then
    echo "硬盘资源，以达30，放心使用"
    echo "$webhook告警信息"
fi
}
check5_disk(){
  check1_disk
  check2_disk
  check3_disk
  check4_disk
}
check5_disk