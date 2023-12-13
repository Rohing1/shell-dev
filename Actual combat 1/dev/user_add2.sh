#!/bin/bash
username="${1}"
pwd="${2}"
#创建用户
useradd ${1}
#创建密码
echo "${pwd}" | passwd --stdin "${username}"
