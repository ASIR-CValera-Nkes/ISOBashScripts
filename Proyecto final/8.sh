#!/bin/bash

fich="fichero2.txt"

#Esto es para el ejercicio 9.sh no hacer caso
if [[ $1 != "" ]];
then
	fich=$1
fi
#Hacer caso

palabras=(`cat $fich`)
lastpalabra=`echo $palabras | cut -d$' ' -f1`
iguales=1
len=${#palabras[@]}

if [[ len > 1 ]];
then
	for i in ${palabras[@]:1};
	do
		if [ $i != $lastpalabra ];
		then
			iguales=0
		fi
		lastpalabra=$i
	done
else
	echo "Escribe más de una palabra delimitada por espacios en el archivo 'fichero2.txt'"
	exit
fi

if [ $iguales == 1 ];
then
	echo "Las $len palabras son iguales."
else
	echo "Las $len palabras NO son iguales."
fi
