#!/bin/bash

OIFS=$IFS
IFS="ñ"

lines=`sort /etc/passwd | tr "\n" "ñ"`

for line in $lines[@];
do
        #test=`echo $line | cut -d: -f6`
        #if [[ $line == *":"* && $test != "" ]];
        #then
                echo "Usuario: $(echo $line | cut -d: -f1)"
                echo "Intrprete: $(echo $line | cut -d: -f6)"
                echo "Directorio: $(echo $line | cut -d: -f7)"
                echo ""
        #fi
done

IFS=$OIFS
