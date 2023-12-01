#!/bin/bash

#Name:cbs_release_forward.sh
#用途：截取URL地址，并打印出来，在加上下载
#Author:rohing
#History:20230310 Version:1.1

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

# 执行 new1_url 函数并输出结果
new1_url

echo "上面地址是刷新CDN地址"
#******************************************************

echo "下面地址是下载地址"
#******************************************************
# 读取第一行 URL 并下载
url1=$(awk 'NR==1' "$file_path")
md5_cp=$(awk 'NR==1' "$file_path" | awk -F '/' '{print $5}')

wget -q `cat test.txt |awk 'NR==1'`

if [ $? -eq 0 ]; then
    echo "正在下载，请稍等"
    md5sum `cat test.txt | awk 'NR==1' |awk -F '/' '{print $5}'`
else
    echo "请复制上面地址刷新CDN"
    exit 1
fi

