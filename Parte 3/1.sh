#!/bin/bash

uc=`w | sed -n '2p' | wc -l` #Obtenemos las conexiones con el comando w, recortamos la primera linea y mostramos desde ahí, y ya contamos con wc -l

echo "Actualmente hay $uc usuarios conectados."
