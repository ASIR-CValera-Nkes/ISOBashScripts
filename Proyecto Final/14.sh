#!/bin/bash

source ../api.sh

iters=10 #Iteraciones que por defecto vamos a hacer cada iteración es una fila
contador=0 #Contador que el while usa para saber cuando parar
numerico="^[0-9]+$" #Expresión regular que sirve para saber si la variable es un número o no, básicamente, ^es el inicio 0-9 es el rango de valores que coge, el + quiere decir que se pueden repetir infinitamente estos
#y el dolar el final de la string, buscamos basicamente que la cadena de caracteres o stringm sea solo numeros, entonces, podremos decir que es un número

if [[ $1 != "" && $1 =~ $numerico ]]; #Si el parametro nº 1 no está vacío y es una variable númerica, quiere decir que podemos tomar el parametro 1 como el numero de iteraciones máximas (el numero de filas que vamos a escribir)
then #Esto lo hacemos por el motivo de que no nos timen
	iters=$1
fi

echo "Inserte $iters filas con el siguiente formato de campos (DNI|apellido1|apellido2|nombre|edad|fecha_nacimiento)"
echo "Para salir en caso necesario, utilice Ctrl+C"
echo ""

while [[ $contador < $iters ]];
do #Esto lo hacemos mientras que el numero de filas que hayamos insertado sea menor al que hayamos establecido
	fila="" #Declaramos el valor de la fila
	for campo in `head datos.txt -n1 | tr "|" " "`; #Aqui hacemos un bucle, tenemos que tener en cuenta que para que bash tome una cadena de caracteres o string como una lista de elementos/vector o array, estos deben de estar separados por espacios
	do #Cuando vemos funcionar el script está más claro, simplemente, iteramos cada uno de los campos iniciales del txt, con la simple razón de poder insertar uno a uno su valor concatenandoselo a la variable $fila
		read -p "Introduce el $campo: " valor #Leemos el valor que el usuario ha introducido para cada campo en concreto (según la iteración, pues irá cambiando de DNI, a apellido1, apellido2, nombre, edad, fecha_nacimiento y así la siguiente fila)
		fila+="$valor|" #Concatenamos el valor a la fila y lo separamos con |
	done
	fila=${fila:0:-1} #Una vez terminado de introducir campos separados por |, borramos el último caracter sobrante
	escribir "datos.txt" $fila #Y escribimos el resultado a nuestro txt
	((++contador)) #Incrementamos el valor del contador por uno y proseguimos, hasta  que el while diga que es suficiente.
done

echo "Insertadas $iters filas en 'datos.txt', mostrando:"
echo ""

cat datos.txt
