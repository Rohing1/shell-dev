#!/bin/bash
#接收新的主机名
new_hostname=${1}
hostanmectl set-hostname $1
#查看新的主机名
echo :新的主机名是:$1

