#!/bin/bash
i=1
while [ $i -lt 100 ]
do
	if [ $[$i%3] -eq 0 ]; then
		echo $i
	fi
	let i++ 
done

