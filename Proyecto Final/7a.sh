#!/bin/bash

clave=`cat fichero.txt`

if [[ $clave == "militron" ]];
then
	echo "¡Acertates!"
else
	echo "¡Fallaste!"
fi
