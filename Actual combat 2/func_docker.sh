#!/bin/bash
#这是检测docker 是否运行的脚本，不运行的话 启动或者安装
func_docker(){
start=“systemctl start docker”
enable=“systemctl enable docker”
a="ps -ef | grep docker |wc -l" #正常只会出现一个进程 小于大于1的。改进程没有运行
if [ $a -lt 1 ]
then
  echo "docker 没有运行或者没有安装"
  apt-get install docker-ce -y || yum install docker-ce -y #安装docker
  echo ${start}   #启动docker
  echo ${enable}   #开机自启动docker
  docker -v  #查看版本
  exit 0
  else
   if [ $a -gt 1 ]
echo "启动正常，如果未正常运行。请检查其他"
docker -v
fi
  }
func_docker