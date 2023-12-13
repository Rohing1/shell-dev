#!/bin/bash
i=1
read -p "num:"
while [ $i -le 500 ]
do
       if [ $[$i%7 ] -eq 0 ] ; then
       echo $i
       fi
       let i++
done

