#!/bin/bash

if [[ $1 != "" ]];
then
	echo `date | tr -s " " | cut -d$' ' -f$1`
else
	echo "Debes de decir que dato de la fecha quieres."
fi
