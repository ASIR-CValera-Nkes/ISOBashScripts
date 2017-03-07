#!/bin/bash

curhour=`echo $(bash "$(pwd)/get_date.sh" 4) | cut -d: -f1`
source get_user.sh

if [[ $curhour -ge 5 && $curhour -lt 13 ]];
then
	echo "¡Buenos días, $user!"
elif [[ $curhour -ge 13 && $curhour -lt 20 ]]
then
	echo "¡Buenos tardes, $user!"
else
	echo "¡Buenos noches, $user!"
fi
