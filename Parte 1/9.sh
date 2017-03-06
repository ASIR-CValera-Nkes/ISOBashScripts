#!/bin/bash

function get_random
{
	if [[ "$1" != "" && "$2" != "" ]];
	then
		echo `shuf -i $1-$2 -n 1`
	else
		echo -1
	fi
}

#Replace at desired position
#$1 = String
#$2 = Char
#$3 = Int
function ind_rp
{
	if [[ $1 != "" && $2 != "" && $3 != "" ]];
	then #Comprobar los tipos
		len=${#1}
		x=$1
		c=$2
		p=$3
		res=""
		if [[ p > 0 ]];
		then
			res+="${x:0:$((p - 1))}"
		fi
		res+=c
		if [[ p < $((len - 1)) ]];
		then
			res+="${x:$p}"
		fi
		echo $res
	else
		echo 0
	fi
}

#function get_anon
#{
#	r=""
#	for i in `seq 1 $1`;
#	do
#		r+="_"
#	done
#	echo $r
#}

#0
function get_one_number
{
	spos=$(get_random 0 $((${#BASHPID} - 1)))
	npista=${BASHPID:spos:1}
	echo "($BASHPID) Uno de los números del PID es: $npista"
}

#1
function get_number_pos
{
#	res=""
#	for i in `seq 0 $((${#BASHPID} - 1))`;
#	do
#		if [[ $(get_random 1 100) < 50 ]];
#		then
#			res+=${BASHPID:i:1}
#		else
#			res+="_"
#		fi
#	done
#	if [[ $res == $(get_anon ${#BASHPID}) ]];
#	then
#		
#	fi
	res=$BASHPID
	pos=0
	cnt=$(get_random 1 $(${#BASHPID} - 2))
	for i in `seq 0 $cnt`;
	do
		res=$((ind_rp $res "_" $i))
		pos=$((++pos))
	done
	echo "($BASHPID) Parte del PID es: $res"
}

function get_pista
{
	pista="¡Pista! "
	i=$(get_random 0 6)
	case $i in
		0) #Mostrar un número del PID (sólo uno)
			pista+=get_one_number
		;;
		1) #Mostrar más de un número, o incluso un número (la diferencia con el anterior es que muestra las posiciones), pero todos menos uno como máximo
			
		;;
		2) #Mostrar uno o varios numeros, pero no todos, de la razionalización, ej: 50 -> 2 5 5 -> 5 o 2 5
			
		;;
		3) #Mostrar resultado de lo anterior
			
		;;
		4) #Mostrar número de cifras
			
		;;
		5) #Mostrar número más cercano a las centenas o unidades de millar (simplemente, hacer 10^x, donde x, es el resultado de lo anterior)
			
		;;
		6) #Mostrar un rango de numeros entre los que se encuentra
			
		;;
	esac
	echo "¡Pista! $pista"
}

echo $(get_number_pos)
exit

echo "¡Cuidado! Este programa es ciclico, si quieres salir pulsa Ctrl+C"
echo ""

echo "Introduce el número correspondiente al PID que crees que tiene este proceso."
echo $(get_pista)
echo ""

read -p "Y tu numero es... Escríbelo: " num

exit

numerico="^[0-9]+$"

if [[ $num =~ $numerico ]];
then

	acierto=$(($BASHPID == $num))

	if [[ $BASHPID == $num ]];
	then

		echo "¡Acertaste! El PID era $num"

	elif [[ $BASHPID > $num ]]
	then

		echo "El PID es mayor. Sigue intentándolo."

	else

		echo "El PID es menor. Sigue intentándolo."

	fi

	if [ "$acierto" == 0 ];
	then

		bash 9.sh

	fi

	exit

else

	echo ""
	echo "Por favor, introduce un valor númerico, ya que un PID es un identificador numérico."
	echo ""

	bash 9.sh
	exit

fi
