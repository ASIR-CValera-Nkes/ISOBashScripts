#!/bin/bash

echo "¡Cuidado! Este programa es ciclico, si quieres salir pulsa Ctrl+C"
echo ""

read -p "Introduce el número correspondiente al PID que crees que tiene este proceso: " num

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
