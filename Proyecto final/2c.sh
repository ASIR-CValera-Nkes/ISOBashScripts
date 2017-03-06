#!/bin/bash

hostname
date

echo ""

echo "Este programa te listará los grupos que tienes en tu ordenador, atendiendo a una leyenda, la cual se divide en los siguientes epigrafes: "
echo ""
echo "Nombre de grupo"
echo "Numero de grupo"
echo "Usuarios anidados, que son los usuarios los cuales pertenencen a dicho grupo"
echo ""
echo "Explicado esto comenzaremos a mostrar resultados, una vez pulses una tecla."

read -p "" kk

echo ""
echo "Listando grupos ordenados por nombre de usuario:"
echo ""

bash 2a.sh

echo ""
echo "Listados correctamente por nombre los grupos, pulse cualquier tecla (otra vez) para continuar."

read -p "" kk

echo ""
echo "Listando grupos ordenados por su número:"
echo ""

bash 2b.sh


