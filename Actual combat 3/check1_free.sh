#!/bin/bash
#Author:rohing
#History:20231212 Version:1.0
check_free(){
cat <<EOF
查看最大支持多少内存
查看最多支持多少插槽
查看1-4槽位的内存信息
EOF

maximum="echo `dmidecode -t memory |awk 'NR==10'|awk -F ':' '{print $2}'`"
maxfree="echo `dmidecode -t memory |awk 'NR==12'|awk -F ':' '{print $2}'`"
free1=$(dmidecode -t memory |awk 'NR==20 ' && dmidecode -t memory |awk 'NR==25')

free2=$(dmidecode -t memory |awk 'NR==55 ' && dmidecode -t memory |awk 'NR==60')

free3=$(dmidecode -t memory |awk 'NR==90 ' && dmidecode -t memory |awk 'NR==95')

free4=$(dmidecode -t memory |awk 'NR==125' && dmidecode -t memory |awk 'NR==130')


path=/root/test.txt
dmidecode -t memory >>$path
echo  "查看最大支持多少G"
echo  "$maximum"
echo  "最多可以插入多少条子"
echo  "$maxfree"
echo "查看卡槽1"
echo "$free1"
echo "查看卡槽2"
echo "$free2"
echo "查看卡槽3"
echo "$free3"
echo "查看卡槽4"
echo "$free4"

}
check_free
