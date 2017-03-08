#!/bin/bash

for nombre in `cat procedencia.txt | grep "Portugal" | cut -d: -f1`;
do
	echo "$nombre es de Portugal"
done
