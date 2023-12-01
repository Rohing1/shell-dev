#!/bin/bash
func_curl (){
#检测网站网站是否运行
URL1=“https://robing.me”
URL2=“https://note.rohing.xyz”
curl -o -s  $URL1 >/dev/null

if [ $? -eq 0 ]
then
  echo "该网站正常运行"
  else
    echo "改网站已经挂了，请检查"
    fi
    }
    func_curl