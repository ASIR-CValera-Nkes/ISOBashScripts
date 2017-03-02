#!/bin/bash

read -p "Introduzca un número menor de 10: " num

if [ "$num" < 10 ];
then
	echo "El numero $num es menor que 10"
elif [ "$num" > 10 ]
then
	echo "El numero $num es mayor que 10"
elif [ "$num" -eq 10 ]
then
	echo "El numero $num es igual a 10"
else
	echo "'$num' no es un número."
fi
