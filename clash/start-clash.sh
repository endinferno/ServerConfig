#!/bin/bash

CLASH_BASE=$HOME/clash
FILE=$CLASH_BASE/clash.log
clash_pid_list=$(ps -aux | grep -v grep | grep clash | grep yaml | awk -F ' ' '{print $2}')
if [[ ! -z "$clash_pid_list" ]]
then
	kill -9 $clash_pid_list
fi
if [ -f "$FILE" ]; then
	rm $FILE
fi
nohup $CLASH_BASE/clash -f $CLASH_BASE/ByWave.yaml > $CLASH_BASE/clash.log 2>&1 &
