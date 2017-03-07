#!/bin/bash

rm "ficheroprueba.txt"
cp "fichero2.txt" "ficheroprueba.txt"
bash comprimir.sh "fichero2.tar.gz" "$(pwd)/fichero2.txt"

#Descomprimir

tar -xvzf "fichero2.tar.gz"


#Ejecutamos el script anterior

bash 8.sh "ficheroprueba.txt"
