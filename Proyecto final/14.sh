#!/bin/bash

iters=10
contador=0
numerico="^[0-9]+$"

OIFS=$IFS
IFS="|"

campos=(`head datos.txt -n1`)

IFS=$OIFS

if [[ $1 != "" && $1 =~ $numerico ]];
then
	iters=$1
fi

echo "Inserte $iters filas con el siguiente formato de campos (DNI|apellido1|apellido2|nombre|edad|fecha_nacimiento)"
echo "Para salir en caso necesario, utilice Ctrl+C"

while :
do
	for i in $campos;
	do
		read -p "" valor
	done
	if [[ $contador -ge $iters ]];
	then
		break
	fi
	((++contador))
done

echo "Insertadas $iters filas en 'datos.txt', mostrando:"
echo ""

cat datos.txt
