#!/bin/bash
source /etc/profile

URL=`echo $1 | sed -e 's/hadesssh\:\/\///' | sed -e 's/\///'`
IP_ADDRESS=`echo $URL | cut -d'@' -f2`
USER=`echo $URL | cut -d'@' -f1`

if [ $USER = $IP_ADDRESS ]
then
	USER=cluster
fi

echo IP_ADDRESS : $IP_ADDRESS
echo USER : $USER

ssh -o "ProxyCommand ssh sshfwd@hades.hevs.ch -W %h:%p" -XY $USER@$IP_ADDRESS
