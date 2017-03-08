#!/bin/bash

source ../api.sh #Equivalente a un include
user=`get_user`

if [[ $user == "Benito" ]];
then
	echo "¡Hola Benito!"
else
	echo "¡Hasta luego, $user!"
fi
