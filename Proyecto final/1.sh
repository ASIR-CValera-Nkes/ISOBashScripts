#!/bin/bash

OIFS=$IFS
IFS="|"

lines=`sort /etc/passwd | tr "\n" "|"`
linesarr=($lines)

for ((i = 0; i<${#linesarr[@]}; ++i))
do
	line=${linesarr[$i]}
        #test=`echo $line | cut -d: -f6`
        #if [[ $line == *":"* && $test != "" ]];
        #then
                echo "Usuario: $(echo $line | cut -d: -f1)"
		echo "Contraseña: $(echo $line | cut -d: -f2)"
		echo "Nombre: $(echo $line | cut -d: -f5)"
                echo "Directorio: $(echo $line | cut -d: -f6)"
                echo "Intérprete: $(echo $line | cut -d: -f7)"
                echo ""
        #fi
done

IFS=$OIFS
