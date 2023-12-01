#!/bin/bash
#请输入要备份的目录
back_file(){
read -p "请输入要备份的目录：" backup_srv
read -p "请输入要备份的目录：" src_srv
mkdir -p ${src_srv} && cp -a ${backup_srv} ${src_srv}
echo -e "备份数据如下：\n(ls $src_srv)"
}
back_file