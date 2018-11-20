#!/bin/bash

echo $@ > /home/pi/AAAA
echo "compare file is $1"
globalHash=$(dd if="$1" | md5sum)
echo "$globalHash" >> /home/pi/AAAA
status=1


function hash()
{
	hash=$(dd if=$1 | md5sum)
	echo "$hash" >> /home/pi/AAAA
	if [ "$globalHash" == "$hash" ];
	then
		return 0;
	else
		return 1;
	fi

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
