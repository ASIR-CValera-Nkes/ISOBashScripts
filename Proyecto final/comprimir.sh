#!/bin/bash

#$1 = Nombre del archivo
#$2 = Lo que quieres comprimir
if [[ $1 != "" && $2 != "" ]];
then
	echo "Comprimido el archivo '$1' en '$2'."
	echo ""

	rm $1
	touch $1
	tar -cvzf $1 $2
else
	echo "Debes de especificar los 2 paramétros necesarios para ejecutar este script."
	echo ""
fi
