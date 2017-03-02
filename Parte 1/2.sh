#!/bin/bash

read -p "Introduce un número: " prim
read -p "Introduce otro número: " sec

if [ "$prim" -eq "$sec" ];
then
	echo "¡Los dos números introducidos son iguales!"
elif [ "$prim" < "$sec" ]
then
	echo "$prim es menor que $sec"
elif [ "$prim" > "$sec" ]
then
	echo "$sec es mayor que $prim"
fi
