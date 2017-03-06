#!/bin/bash

usernick=`cat /etc/passwd | grep "$(whoami)" | cut -d: -f1`
username=`cat /etc/passwd | grep "$(whoami)" | cut -d: -f5`
[[ "${username/\"/}" == *","* ]] && user=$usernick || user=$username #Condición ternatia ( true/false ? true : false )
