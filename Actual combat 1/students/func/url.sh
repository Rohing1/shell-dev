#!/bin/bash
rohing_url(){
`curl -s -o /dev/null www.rohing.xyz`
}
baidu_url(){
`curl -s -o /dev/null www.baidu.com`
}
#定义URL的
if [ "$#" -ne 1 ]
then
	echo "Usage:$0,url:bd.rh"
	exit
fi
case $1 in
	bd)
	`curl -s -o /dev/null www.baidu.com`
	#echo "$baidu_url"
log_success_msg 	echo "baidu is running"
		exit 0
		;;
         rh)
      `curl -s -o /dev/null www.rohing.xyz`
		# echo "$rohing_url"
log_success_msg 	 echo "rohing is running"
	exit 0
	 ;;
          *)
  
	  echo "请输入:bd,rh"
esac
	  
