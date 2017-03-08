#!/bin/bash

read -p "Introduce el nombre del usuario que quieres comprobar si existe: " user

for u in `cat /etc/passwd | grep "home"`;
do
	if [[ $u == *"$user"* ]];
	then
		echo "El usuario '$user' existe."
		echo ""
		line=`cat /etc/passwd | grep "$u"`
		echo "Usuario: $(echo $line | cut -d: -f1)"
        	echo "UID: $(echo $line | cut -d: -f3)"
		exit
	fi
done

echo "El usuario '$user' NO existe."
echo "Vuelve a intentarlo:"
echo ""

bash 3.sh
exit
