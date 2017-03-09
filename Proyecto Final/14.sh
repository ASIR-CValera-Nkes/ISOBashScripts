#!/bin/bash

source ../api.sh

function comprobar_tipo
{
	nombre_campo=$1
	valor=$2
	if [[ $campos != *"$nombre_campo"* ]];
	then
		echo "El nombre de campo '$nombre_campo' no existe."
	fi
	[[ $nombre_campo == "DNI" && $valor =~ ^[0-9]{8}[A-Z]$
	|| ($nombre_campo == "apellido1" || $nombre_campo == "apellido2" || $nombre_campo == "nombre") && $valor =~ ^[A-Za-z\ ]$
	|| $nombre_campo == "edad" && $valor =~ ^[0-9]{1-3}$ && $valor > 0 && $valor < 150
	|| $nombre_campo == "fecha_nacimiento" && $valor =~ ^\d{2}(/|-)\d{2}(/|-)\d{2,4} ]] && valido=1 || valido=0
	echo $valido
}

if [[ ! -e "datos.txt" ]];
then
	escribir "datos.txt" "DNI|apellido1|apellido2|nombre|edad|fecha_nacimiento"
	escribir "datos.txt" ""
fi

iters=10 #Iteraciones que por defecto vamos a hacer cada iteración es una fila
contador=1 #Contador que el while usa para saber cuando parar
numerico="^[0-9]+$" #Expresión regular que sirve para saber si la variable es un número o no, básicamente, ^es el inicio 0-9 es el rango de valores que coge, el + quiere decir que se pueden repetir infinitamente estos
#y el dolar el final de la string, buscamos basicamente que la cadena de caracteres o stringm sea solo numeros, entonces, podremos decir que es un número

if [[ $1 != "" && $1 =~ $numerico ]]; #Si el parametro nº 1 no está vacío y es una variable númerica, quiere decir que podemos tomar el parametro 1 como el numero de iteraciones máximas (el numero de filas que vamos a escribir)
then #Esto lo hacemos por el motivo de que no nos timen
	iters=$1
elif [[ $1 != "" && $1 != $numerico ]]
then
	echo "Debes introducir un parámetro numérico correspondiente al número de filas que quieres introducir."
	exit
else
	echo "Tomando $iters iteraciones por defecto que será el número de filas que insertarás."
	echo ""
fi

echo "Inserte $iters filas con el siguiente formato de campos (DNI|apellido1|apellido2|nombre|edad|fecha_nacimiento)"
echo "Para salir en caso necesario, utilice Ctrl+C"
echo ""

campos=(`head datos.txt -n1 | tr "|" " "`)

while [[ $contador < $iters ]];
do #Esto lo hacemos mientras que el numero de filas que hayamos insertado sea menor al que hayamos establecido
	fila="" #Declaramos el valor de la fila
	for ((i=0; i<${#campos[@]}; ++i));
        do
		campo=${campos[$i]}
                read -p "Introduce el $campo: " valor
                if [[ `comprobar_tipo "$campo" "$valor"` == 0 ]];
                then
                        echo "Valor introducido para $campo no vlido, por favor vuelve a introducirlo."
                        echo ""
			((--i))
		else
			fila+="$valor|"
                fi
        done
	fila=${fila:0:-1} #Una vez terminado de introducir campos separados por |, borramos el último caracter sobrante
	escribir "datos.txt" $fila #Y escribimos el resultado a nuestro txt
	((++contador)) #Incrementamos el valor del contador por uno y proseguimos, hasta  que el while diga que es suficiente.
done

echo "Insertadas $iters filas en 'datos.txt', mostrando:"
echo ""

cat datos.txt

#Moraleja: A veces, utilizar menos lineas supone menor rendimiento, teniendo en cuenta que a cada iteración tenemos que llamar el comando head, lo mejor sería almacenarlo en una variable
#y llamar a la variable que ya tiene un valor establecido, imaginad, lo que supondría llamar a un comando que llevase un segundo de ejecución para obtener un valor que luego usasemos en un bucle for,
#pues a cada iteración habría que esperar un segundo, mientras que si establecemos la variable desde un principio, solo habría que esperar dicho segundo y lo demás sería instantaneo
#
#for campo in `head datos.txt -n1 | tr "|" " "`;
#do
#	read -p "Introduce el $campo: " valor
#	fila+="$valor|"
#done
