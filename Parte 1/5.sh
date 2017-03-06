#!/bin/bash

read -p "Introduce el nombre del usuario que quieres comprobar si existe: " user

for u in `cat /etc/passwd | grep "home"`;
do
	if [[ $u == $user ]];
	then
		echo "El usuario '$user' existe."
		exit
	fi
done

echo "El usuario '$user' NO existe."
