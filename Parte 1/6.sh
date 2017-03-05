#!/bin/bash

pwda="$(pwd)" #Obtenemos el nombre actual
mydir="${pwda/ /}" #Le quitamos los espacios a la ruta anterior
#Ahora concatenamos la fecha a otro reemplazamiento (esta vez le quitamos las baras de la ruta) para formar el nombre del archivo
finalfolder="/home/$(whoami)"
finalpath="/$finalfolder/$(date '+%Y-%m-%d')${mydir///}.tar.gz" #Y a esto le sumamos la ruta de la carpeta de usuario actual (en mi caso /home/usuario)

rm $finalpath #Si creamos varios archivos el mismo dia tendremos que borrar el ultimo que creamos

touch $finalpath #Creamos el archivo vacio para que el comando tar no tenga problemas

tar -czfv $finalpath "$mydir" #Esto comprimirá la carpeta actual

echo "Carpeta actual comprimida en la carpeta '$finaldir'."
echo ""

ls -l $finalfolder #Listamos el directorio para ver el nuevo archivo
