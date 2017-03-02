#!/bin/bash

read -p "Escribe algo: " prim
read -p "Escribe otra cosa: " sec

if [[ "$prim" == "$sec" ]];
then
	echo "Las dos cadenas de texto son iguales."
else
	echo "Las dos cadenas de texto son distintas."
fi
