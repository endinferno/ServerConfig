#!/bin/bash

FILE=$HOME/clash/clash.log
if [ -f "$FILE" ]; then
	rm $FILE
fi
nohup $PWD/clash/clash -f $PWD/clash/ByWave.yaml > $PWD/clash/clash.log 2>&1 & 
