#!/bin/bash

source ../api.sh

curhour=`date +%H`
user=`get_user`

if [[ $curhour -ge 5 && $curhour -lt 13 ]];
then
	echo "¡Buenos días, $user!"
elif [[ $curhour -ge 13 && $curhour -lt 20 ]]
then
	echo "¡Buenos tardes, $user!"
else
	echo "¡Buenos noches, $user!"
fi
