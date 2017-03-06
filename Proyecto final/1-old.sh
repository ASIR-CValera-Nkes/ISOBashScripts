#!/bin/bash

#cat /etc/passwd | cut -d$'\n' -f1 | sort -ns

#echo ""

#tes=( $(cat /etc/passwd | cut -d$'\n' -f1 | sort -ns) )
#for i in `seq 0 $(wc -l /etc/passwd | cut -d$' ' -f1)`;
#do
#	echo ${tes[$i]}
#done

prueba=`sort /etc/passwd | tr "\n" "ñ"`
pruebaArray=($prueba)

for((i=0; i<${#pruebaArray[@]}; ++i));
do
	echo "cosa: ${pruebaArray[$i]}"
done

exit

for i in $(cat /etc/passwd | cut -d$'\n' -f1 | sort -ns);
do
echo $i
#echo `echo $i | cut -d: -f1,6,7`
done

exit

for line in `sort /etc/passwd`;
do
	test=`echo $line | cut -d: -f6`
	if [[ $line == *":"* && $test != "" ]];
	then
		echo "Usuario: $(echo $line | cut -d: -f1)"
		echo "Intérprete: $(echo $line | cut -d: -f6)"
		echo "Directorio: $(echo $line | cut -d: -f7)"
		echo ""
	fi
done
