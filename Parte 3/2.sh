#!/bin/bash

res=`cat /etc/passwd | grep "home"`
len=`echo $res | wc -l`

echo "Hay $len entradas que cumple este requisito."

if [[ ! -e "all.users" ]];
then
	for entrada in $res;
	do
		echo $entrada >> "all.users"
	done
fi

cat "all.users"
