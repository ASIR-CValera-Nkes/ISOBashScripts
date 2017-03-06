#!/bin/bash

source get_user.sh #Equivalente a un include

if [[ $user == "Benito" ]];
then
	echo "¡Hola Benito!"
else
	echo "¡Hasta luego, $user!"
fi
