#!/bin/bash

text="$(headsetcontrol -b -c)%"
if [[ $text == "-1%" ]]
then
    text="Charging"
fi

echo $text
