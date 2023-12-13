#!/bin/bash
#用途：按下数字查看服务器的水位，
#Author:rohing
#History:20231208 Version:1.0
check_path(){
check_os(){
echo "$(grep -i 'pretty_name' /etc/os-release |awk -F '"' '{print $2}')"
}
check_uname(){
echo "`$uname -r`"
}
check_ip(){
echo "$(curl -s ifconfig.me)"
}
check_free(){
echo "$(free -m |awk 'NR==2{print $3/$2*100}')%"
}
check_cpu(){
echo  "$(sar -u 1 1|awk 'NR==5{print $NF}')%"
}
check_disk(){
df -h |awk '/\/$/{print $5}'
}
check_name(){
echo "$(hostname)"
}
check_nvidia(){

echo $(gpustat |awk 'NR==2'|awk -F '|' '{print $3}'|awk '{print $1/$3*100}')%
#echo $(nvidia-smi |awk 'NR==10'| awk -F ' ' '{print $9 /$11*100}')%
#echo $(nvidia-smi | awk 'NR==10 {printf "%.0f", $9 / $11 * 100}')
}
}
check_path
show_ment(){
cat <<EOF
1.查看系统版本。
2.查看系统内核。
3.查看公网IP地址。
4.查看服务器内存占比。
5.查看CPU占比。
6.查看硬盘占比。
7.查看显卡占比（待优化）。
8.exit

EOF
}
show_ment
read -p "请输入相对的的数字:" num
case  $num in 
        1)
                check_os
        ;;
        2)
                check_uname
        ;;
        3)
                check_ip
        ;;
        4)
                check_free
        ;;
        5)
                check_cpu
        ;;
        6)
                check_disk
        ;;
        7)
                check_nvidia
        ;;
        *)
                echo "请输入数字"
                exit
        ;;
esac