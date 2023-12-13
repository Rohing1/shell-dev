#!/bin/bash
#检测是否安装docker
echo "检测是否安装docker-ing"
docker -v 
echo $?

 if [ $? -gt  1 ] ;then
	echo "docker安装成功"
else
	echo "没有安装docker，请看是否需要安装docker。"
fi
#	curl -sSL https://get.daocloud.io/docker | sh
#	echo $?
#	if [ $? -eq 0 ] ;then
 #       echo "已经检测到docker安装。"
#	fi


