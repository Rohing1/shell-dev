#!/bin/bash
i=1
until ((i>100))
do
	if [ $[$i%10] -eq 0 ];then
		echo $i
	fi
	let i++
done

