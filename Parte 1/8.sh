#!/bin/bash

read -p "Introduce un número: " num

numerico="^[0-9]+$"

if [[ $num =~ $numerico ]];
then

if [[ "$(($num % 101))" == 0 ]];
then
	echo "El valor introducido ES divisible por 101."
else
	echo "El valor introducido NO ES divisible por 101."
fi

else

echo ""
echo "No has introducido un valor numérico."
echo ""

bash 8.sh
exit

fi
