#!/bin/bash

source ../api.sh

#Esto para hacer la prueba

if [[ $# == 0 ]];
then
	if [[ ! -e "2.txt" ]];
	then
		echo "Escrito los cuatro archivos necesarios, ahora llama a este script así: 'bash 12.sh 1.txt 2.txt 3.txt 4.txt'"
		bash 12wr.sh
		exit
	else
		echo "Los 4 archivos ya existen, ahora ejecuta el programa con los 4 parámetros correspondientes."
		exit
	fi
elif [[ $# == 4 ]]
then
	if [[ ! -e "2.txt" ]];
	then
		echo "Primero ejecuta este script sin parámetros."
		exit
	fi
	touch "1.txt"
else
	echo "El programa necesita 4 parametros que corresponde a los nombres de los archivos (1-4).txt para funcionar."
	exit
fi

#Comenzamos con el programa

arr=($*)
archivo=${arr[@]:0:1}

for fichero in ${arr[@]:1};
do
	escribir `cat $fichero` $archivo
done
