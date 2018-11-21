#!/bin/bash

globalHash="$1"
echo "$globalHash" >> /home/pi/AAAA
status=1


function hash()
{
	<"$1" head -c "$(stat -c %s $globalHash)" | cmp  - $globalHash
	return $?
}
	

c=0
for i in "${@:2}"
do
	hash $i
	if [ $? -ne 0 ]; then 
		exit 0
	fi
done

exit 1
