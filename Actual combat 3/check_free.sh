#!/bin/bash
#用途：按下数字查看内存的水位，
#Author:rohing
#History:20231212 Version:1.0
kill_free="`kill -9 $(ps -eo pid,%mem --sort=-%mem | awk 'NR==2 {print $1}')`"
check_free="$(free -m |awk 'NR==2{printf "%.0f", $3/$2*100}')"
check1_free(){
if [  "$check_free" -ge 90  ]; then
    echo "内存过高，以达到百分之90，需要kill占最高的进程。"
    echo "$kill_free"

fi
}
check2_free(){
if [  "$check_free" -ge 70  ]; then
    echo "内存以达到百分之70，请检查进程。"
fi
}
check3_free(){
if [  "$check_free" -lt 40  ]; then
    echo "可以放心使用。。"
fi
}
check_free1(){
  check1_free
  check2_free
  check3_free
}
check_free1
