#!/bin/bash
source /etc/profile

URL=`echo $1 | sed -e 's/hadesvnc\:\/\///' | sed -e 's/\///'`
IP_ADDRESS=`echo $URL | cut -d'@' -f2`
USER=`echo $URL | cut -d'@' -f1`

if [ $USER = $IP_ADDRESS ]
then
	USER=cluster
fi

echo IP_ADDRESS : $IP_ADDRESS
echo USER : $USER
LOCAL_PORT=`shuf -i 10000-65000 -n 1`

ssh sshfwd@hades.hevs.ch -L$LOCAL_PORT:$IP_ADDRESS:5900 -N &
SSH_PID=$!
sleep 1
vinagre localhost:$LOCAL_PORT
wait $SSH_PID

read

