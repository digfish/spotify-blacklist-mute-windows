#!/bin/bash
PAUSELOOP=2
echo "Period of reexecution is $PAUSELOOP seconds!"
while true
	do ./spotifymute_helper.sh
	if [[ 1 -eq $? || 2 -eq $? ]]
		then sleep $PAUSELOOP
	fi
done
