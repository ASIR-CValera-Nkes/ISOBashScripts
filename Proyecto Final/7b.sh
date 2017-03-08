#!/bin/bash

#Realmente no se deberia de especificar la clave...

read -p "Comprueba la palabra especifica en 'fichero1b.txt' (en este caso 'militron'): " clave

if [[ $clave != "militron" ]];
then
	echo "Estás obligado a especificar 'militron' como clave."
	echo ""

	bash 7b.sh
	exit
fi

if [[ `cat fichero1b.txt` == *"$clave"* ]];
then
	echo "Este fichero contiene la clave deseada."
else
	echo "Este fichero NO contiene la clave deseada."
fi
