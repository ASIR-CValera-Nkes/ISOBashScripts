#!/bin/bash

OIFS=$IFS
IFS="|"

#Ya que por defecto el archivo /etc/group va ordenado por nº de grupo, con listarlo es suficiente...
lines=`cat /etc/group | tr "\n" "|"`
linesarr=($lines)

for ((i = 0; i<${#linesarr[@]}; ++i))
do
        line=${linesarr[$i]}
        echo "Usuario: $(echo $line | cut -d: -f1)"
        echo "Nº de grupo: $(echo $line | cut -d: -f3)"
        echo "Usuarios anidados: $(echo $line | cut -d: -f4)"
        echo ""
done

IFS=$OIFS
