#!/bin/bash
#用途：按下数字查看显卡的水位，
#Author:rohing
#History:20231211 Version:1.0
check_nvidia=$(nvidia-smi |awk 'NR==10'| awk -F ' ' '{printf "%.0f", $9 /$11*100 }')
#check_nvidia=$(nvidia-smi | awk 'NR==10 {printf "%.0f", $9 / $11 * 100}')
check1_gpu(){
if [  "$check_nvidia" -ge 90  ]; then
    echo "显卡显存过高，以达到百分之90，需要重启docker"
    systemctl restart docker

fi
}
check2_gpu(){
if [  "$check_nvidia" -ge 80  ]; then
    echo "显卡显存过高，以达百分之80，请注意显存。"

fi
}
check3_gpu() {
if [  "$check_nvidia" -ge 70  ]; then
    echo "显卡显存过高，以达百分之70，请注意显存。"

fi
}
check4_gpu(){
if [  "$check_nvidia" -lt 50  ]; then
    echo "显卡显存低于50%以下，放心使用。"

fi
}
check_nvidia1(){
 check1_gpu
 check2_gpu
 check3_gpu
 check4_gpu
}
check_nvidia1