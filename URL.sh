#!/bin/bash
#Name:URl.sh
#用途：截取URL地址，并打印出来
#Author:rohing
#History:20230310 Version:1.0
file_path="/root/test.txt"

if [ -f "$file_path" ]; then
    echo "文件存在"
else
    echo "文件不存在"
    touch "$file_path"
    exit 0
fi

new1_url(){

    local url_list=$(cat "$file_path") # 读取文件内容到变量
    while IFS= read -r line; do
        local new_url=$(echo "${line}" | sed 's/http:/https:/g' | sed 's/download\//downloads\//g' | sed 's/go\//downloads\//g' | sed 's/_[0-9]*\.exe/.exe/')
        echo "${new_url}"
    done <<< "$url_list"
}
new1_url
