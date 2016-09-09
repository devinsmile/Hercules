#!/bin/bash

n=0

while true; do
	$@ && break
	if [[ $n -ge 5 ]]; then
		exit -1
	fi
	waittime=$((2**n))
	echo "Execution of $@ failed. Retrying in $waittime seconds..."
	sleep $waittime
	n=$((n+1))
done
