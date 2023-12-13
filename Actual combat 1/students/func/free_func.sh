#!/bin/bash

#FreeM="free -m |awk 'NR==2 {print $NF}'"
FreeM=`free -m |awk 'NR==2 {print $NF}'`
Pass="内存不足，$FreeM"
   if [ "$FreeM" -lt 200 ]
     then
        echo $pass |tee /tmp/free.txt
        echo "内存不足，请抓紧清理"
   fi
