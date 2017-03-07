#!/bin/bash

if [[ $1 == "fichero3.txt" ]];
then
	echo "Mostrando los contenidos del archivo 'fichero3.txt':"
	echo ""
	cat $1
else
	echo "DEBES de mostrar los contenidos del arhivo 'fichero3.txt' para este ejercicio. Escribe pues 'bash 10.sh fichero3.txt'"
fi
