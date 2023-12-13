#!/bin/bash
username="${1}"
pwd="${2}"
#创建用户
useradd ${1}
#创建密码
echo "${pwd}" | passwd --stdin "${username}"

#[root@localhost dev]# bash user.sh "test1" "test123"
#更改用户 test1 的密码 。
#passwd：所有的身份验证令牌已经成功更新。