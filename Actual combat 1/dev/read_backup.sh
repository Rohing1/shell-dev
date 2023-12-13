#!/bin/bash
read -p "请输入路径" backup_dir
read -p "备份的路径" src_dir
mkdir -p ${src_dir} && cp -a ${backup_dir} ${src_dir}
echo -e "备份的数据如下:\n$(ls $src_dir)"


