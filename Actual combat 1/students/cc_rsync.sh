#!/bin/bash
#rsync的启动脚本
Start(){
/usr/bin/rsync --daemon
}
Stop(){
pkill rsync
}
Restart(){
pkill rsync && /usr/bin/rsync --daemon
}
Killpro="ps -ef | grep rsync | wc -l"
i=1
if [ $# -ne 1 ]
then
	echo "Usage $0 {start|stop|restart }"
	exit 1
fi
if [ "$1" = "start" ]
then
echo $Start
sleep 2;
if [ `ps -ef | grep rsync | wc -l` -ge 1 ]
then
	echo "Rsync  is down"
	exit 0
fi
elif [ "$1" = "stop" ]
then
	echo "$pkiil rsync" &>>/dev/null
	if [ `ps -ef | grep rsync | wc -l`  -eq 0 ]
	then
		echo "Rsync is down"
		exit 0
	fi

elif [ "$1" = "restart" ]
then
	echo $Stop
	sleep 1
	echo $Start
        sleep 1
if [ "$Killpro"  -eq 0   &&  "$Killpro"  -ge 1 ]
then
	echo "Rsync is restarting!!"

fi

else
	echo "Usage:$0 {start|stop|restart}"
	exit 1
fi




