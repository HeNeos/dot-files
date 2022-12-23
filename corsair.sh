#!/bin/bash

text=$(headsetcontrol -b)
sz=${#text}
pos=$sz
for (( i=$sz-1; i>=0; i--))
do
	if [[ "${text:$i:1}" == " " ]]
	then
		pos=$i
		break
	fi
done

echo ${text:$pos:($sz-$pos)}
