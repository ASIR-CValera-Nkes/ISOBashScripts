#!/bin/bash

read -p "Introduce el nombre de usuario que desea comprobar si existe: " user #Obtenemos el nombre del usuario

#for u in `ls /home/` #Listamos todos los directorios de /home/ lo que nos dará una lista nombre de anombre de los usuarios que existe
#do
#	if [[ "$user" == "$u" ]]; #Comprobamos si dicho el nombre de dicha carpeta (que tiene el nombre de usuario) es igual al nombre de usuario que nosotros hemos especificado
#	then
#		echo "El usuario '$user' ya existe." #Si la encontramos lo decimos...
#		exit 1 #... Y salimos de la aplicacion, por lo que el bucle se acaba
#	fi
#done

#Esto tiene un defecto, y es que si el usuario se borra, no se detectará

#El proposito de esta parte es eliminar los resultados creados por el sistema, y mostrar los resultados a partir de la
#linea donde estan los usuarios creados por nosotros

while read u;
do
	if [[ $u == *"$user"* ]];
	then
		primuser=`echo $u | cut -d ':' -f1`
		break
	fi
done < /etc/passwd

echo $primuser

exit 1

numlinea=`grep -nr $primuser /etc/passwd | cut -d ':' -f1`
totallineas=`wc -l /etc/passwd`
finlinea=`let totallinea-numlinea+1`
contlistado=`tail -$finlinea /etc/passwd`

if [ `$contlistado | grep $user | wc -l` > 1 ];
then
	echo "El usuario '$user' existe."
else
	echo "El usuario '$user' no existe." #Si el bucle acaba quiere decir que no ha encontrado nada, por tanto, ya es hora de notificarlo
fi
