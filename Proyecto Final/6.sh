#!/bin/bash

source ../api.sh

dia=$(get_date 2) #$(bash "$(pwd)/get_date.sh" 2)
mes=$(get_date 3) #$(bash "$(pwd)/get_date.sh" 3)

if [[ $dia == 19 && $mes == "mar" ]];
then
	echo "¡Feliz día del Padre!"
fi
