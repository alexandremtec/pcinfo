#!/bin/bash

##### Port Scanner
##### Autor: Alexandre Martins
##### Email: alexandremtec@gmail.com

TARGET=$1
PORT_START=$2
PORT_END=$3

if [  $# == 3 ]; then
	(ping -W2 -c1 $TARGET > /dev/null )
        
	if [ $? != 0 ]; then
		 echo "Alvo não disponível!"
		 exit
	fi

	for port in $(seq $PORT_START $PORT_END);
	do
		echo $port
		(echo alo > /dev/tcp/$TARGET/$port) > /dev/null 2>&1 && echo -e "Porta $port aberta"
	done
else
	echo -e "Sintaxe incorreta, utilize <portscan.sh> <target_ip> <start_port> <port_end>"
fi
