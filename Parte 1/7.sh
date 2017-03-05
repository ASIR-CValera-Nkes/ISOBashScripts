#!/bin/bash

read -p "Inserte un número: " num

numerico="^[0-9]+$"

if [[ $num =~ $numerico ]];
then

echo "Vamos a mostrar la tabla del $num"
echo ""

for i in `seq 1 10`;
do
	echo "3x$i=$((`expr 3 \* $i`))"
done

else

echo ""
echo "No has introducir un valor numérico."
echo ""

bash 7.sh
exit

fi
