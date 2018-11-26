#!/bin/bash

sync
echo 3 > /proc/sys/vm/drop_caches
globalHash="$1"
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
		echo "check failed"
		exit 0
	fi
done

exit 1
