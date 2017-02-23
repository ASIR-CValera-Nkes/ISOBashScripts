#!/bin/bash

function obtener_carpeta 
{
	read -p "Especifica una ruta de un directorio (una CARPETA): " dir
	echo ""
}

function main 
{
	ddir=$1

	if [[ -f $ddir ]]; then
		echo "La ruta especificada es un archivo, por favor, escribe un directorio"
		echo ""
		obtener_carpeta
		main $dir
		return
	fi

	ultimo=${ddir: -1}
	if [[ $ultimo != "/$" ]]; then
		ddir="$ddir/"
	fi

	lineas=0
	masgrande=0
	archivogrande=""

	for i in `ls -p $ddir | grep -v /`; do	
		lineas=`cat $ddir$i | wc -l`
		echo "Archivo $i con $lineas lineas"
		if [ $lineas -gt $masgrande ]; then
			masgrande=$lineas
			archivogrande=$ddir$i
		fi
	done

	echo ""
	echo "El archivo más grande es '$archivogrande' con $masgrande lineas"
}

obtener_carpeta
main $dir