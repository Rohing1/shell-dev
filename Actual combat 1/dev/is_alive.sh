#!/bin/bash
read -p "请输入要探测的IP地址:" test_ip

ping -c 4 ${test_ip} &>/dev/null
nslookup ${test_ip}
if [ $? -eq 0  ]
then
echo "该主机{test_ip}正常连接。"
else
echo "主机${test_ip}已经timeout，请检查以下"
fi

