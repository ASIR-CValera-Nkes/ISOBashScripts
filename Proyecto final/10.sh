#!/bin/bash

#OIFS=$IFS
#IFS="?"

source ../api.sh

if [[ $1 == "fichero3.txt" ]];
then
	gr=`grep "amor\|odio" $1 | tr " " "|"`
	cnt=`count_list $gr` #`count_list ($gr)`

        echo "Mostrando los $cnt resultados del archivo 'fichero3.txt':"
        echo ""
        for i in $gr; #((i=0; $i < $cnt; ++i));
	do
		echo `echo $i | tr "|" " "` #$gr[$i]
	done
else
        echo "DEBES de mostrar los contenidos del arhivo 'fichero3.txt' para este ejercicio. Escribe pues 'bash 10.sh fichero3.txt'"
fi

#IFS=$OIFS
