#!/bin/bash

read -p "Introduce el nombre de usuario que desea comprobar si existe: " user #Obtenemos el nombre del usuario

for u in `ls /home/` #Listamos todos los directorios de /home/ lo que nos dará una lista nombre de anombre de los usuarios que existe
do
	if [[ "$user" == "$u" ]]; #Comprobamos si dicho el nombre de dicha carpeta (que tiene el nombre de usuario) es igual al nombre de usuario que nosotros hemos especificado
	then
		echo "El usuario '$user' ya existe." #Si la encontramos lo decimos...
		exit 1 #... Y salimos de la aplicacion, por lo que el bucle se acaba
	fi
done

echo "El usuario '$user' no existe." #Si el bucle acaba quiere decir que no ha encontrado nada, por tanto, ya es hora de notificarlo
