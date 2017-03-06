#!/bin/bash

dia=$(bash "$(pwd)/get_date.sh" 2)
mes=$(bash "$(pwd)/get_date.sh" 3)

if [[ $dia == 19 && $mes == "mar" ]];
then
	echo "¡Feliz día del Padre!"
fi
