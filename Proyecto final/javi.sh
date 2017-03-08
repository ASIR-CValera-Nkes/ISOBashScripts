#!/bin/bash

arr=(`cat javi.txt`) 

for i in ${arr[@]:3:2};
do
	echo $i
done
