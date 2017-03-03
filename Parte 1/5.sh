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

#NOTA DESPUÉS DE LA CREACIÓN: Realmente esto es inutil, porque si tu creas un usuario con un nombre que ya contiene
#el archivo /etc/passwd, lo hayas creado tu o no, no te va a dejar.

while read u; #El primer proposito de este bucle es obtener el primer usuario de la lista del passwd, para saber por donde cortar con el tail luego
do #Creamos un bucle while que nos liste todas lineas del archivo /etc/passwd
	for us in `ls /home/`;
	do #Ahora listamos todas las carpetas del /home/ (para obtener el nombre de usuario ya existente)
		if [[ $u == *"$us"* ]];
		then #Si coincide el nombre de la carpeta con el nombre del usuario del while significa que...
			primuser=$us #... almacenaremos el nombre de usuario y...
			break 2 #... y romperemos los 2 bucles, ya que hemos obtenido el primer usuario de la lista
		fi
	done
done < /etc/passwd #Injeccion del archivo el cual queremos leer

numlinea=`grep -nr $primuser /etc/passwd | cut -d ':' -f1` #Obtenemos la linea donde está el nombre del usuario gracias a -nr que nos devuelve algo tal que "25:...", entonces cortamos hasta los puntos suspensivos para obtener el 25
totallineas=`wc -l /etc/passwd | cut -f1 -d ' '` #Obtenemos el total de lineas de /etc/passwd, usando cut para obtener lo que nos interesa únicamente
finlinea=$(($totallineas-$numlinea+1)) #Obtenemos las lineas que hay desde donde está el primer usuario que creamos hasta el final, en nuestro caso, como creamos 3 usuarios nos va a mostrar el numero 3
contlistado=`tail -$finlinea /etc/passwd` #Y recopilamos esta información, que son correspondientes a mi caso a las ultimas 3 lineas

if [[ `echo $contlistado | grep -o $user` != "" ]];
then #Ya con todo esto, lo unico que tenemos que hacer es averiguar si existe o no el usuario que especificamos al principio o no, para ello usamos -o, que lo que hace es devolvernos una cadena con texto si se encuentra algo o vacia
#si no lo hace...
	echo "El usuario '$user' existe."
else
	echo "El usuario '$user' no existe."
fi
