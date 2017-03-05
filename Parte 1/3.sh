#!/bin/bash

read -p "Introduce un número: " prim
read -p "Introduce otro número: " sec

numerico="^[0-9]+$"

if [[ $prim =~ $numerico && $sec =~ $numerico ]];
then

while :
do
echo "¿Qué quieres hacer?"
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"
echo "5) Salir"
read a
  case $a in
	1) echo -n "$prim + $sec = "
	expr $prim + $sec
	;;
	2) echo -n "$prim - $sec = "
	expr $prim - $sec
	;;
	3) echo -n "$prim * $sec = "
	expr  $prim \* $sec
	;;
	4) echo  -n "$prim / $sec = "
	expr $prim / $sec
	;;
	5) echo "Saliendo..." #Mostrar contador??
	  exit 1
	;;
	*)
	  echo "No has seleccionado una opción válida."
	;;
esac
done

else

echo ""
echo "No has introducido un valor númerico."
echo ""

bash 3.sh
exit

fi
