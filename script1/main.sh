#!/bin/bash

file="" #test info file, not configured yet 

export spread=.02 #spread for MVO bots

export endpoint=$PWD"/endpoint"
export options="-Xmx512m -Xms512m"
export credential=$PWD"/test0"
export makers=1
export takers=5
export period=2000


for ((i=0; i<$makers; i++))
do
	java $options -jar fm-maker-mvo.jar -p=$period -C=$credential$i -E=$endpoint .0003 A $spread B $spread &
done

for ((i=$makers; i<$makers+$takers; i++))
do
	java $options -jar fm-taker-mvo.jar -p=$period -C=$credential$i -E=$endpoint .0003 A $spread B $spread &
done