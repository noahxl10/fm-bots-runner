#!/bin/bash

file="" #test info file, not configured yet 

export spread=.02 #spread for MVO bots

export endpoint=$0"/endpoint"
export options="-Xmx512m -Xms512m"
export credential=$0"/test0"
export makers=2
export takers=4


for ((i=0; i<$makers; i++))
do
	java $options -jar fm-maker-mvo.jar -p=1000 -C=$credential$i -E=$endpoint .0003 A $spread B $spread &
done

for ((i=$makers; i<$makers+$takers; i++))
do
	java $options -jar fm-taker-mvo.jar -p=1000 -C=$credential$i -E=$endpoint .0003 A $spread B $spread &
done