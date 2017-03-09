#!/bin/bash

if [[ $_ == 0 ]];
then #Nunca debes ejecutar este script, siempre llamalo con el comando source
        echo "Tonto"
fi

function get_user
{
	usernick=`cat /etc/passwd | grep "$(whoami)" | cut -d: -f1`
	username=`cat /etc/passwd | grep "$(whoami)" | cut -d: -f5`
	[[ "${username/\"/}" == *","* ]] && user=$usernick || user=$username
	#Condición ternaria ( true/false ? true : false )
	echo $user
}

function get_date
{
	if [[ $1 != "" ]];
	then
        	echo `date | tr -s " " | cut -d$' ' -f$1`
	else
        	echo "Debes de decir que dato de la fecha quieres."
	fi
}

function comprimir
{
	#$1 = Nombre del archivo
	#$2 = Lo que quieres comprimir
	if [[ $1 != "" && $2 != "" ]];
	then
        	echo "Comprimido el archivo '$1' en '$2'."
        	echo ""

        	rm "$1"
        	touch "$1"
        	tar -cvzf "$1" "$2"
	else
        	echo "Debes de especificar los 2 paramtros necesarios para ejecutar este script."
        	echo ""
	fi
}

function count_list
{
	arr=($@)
	echo "${#arr[@]}"
}

#function show_results { e4cho ""; }

function join_by { local IFS="$1"; shift; echo "$*"; }

function escribir
{
	if [[ $1 != "" ]];
	then
		if [[ -e $1 ]];
		then
			echo "$2" >> "$1"
		else
			echo "El archivo $2 no existe."
		fi
	else
		echo "Debes especificar un archivo para escribir algo, aunque sea texto vacío."
	fi
}

