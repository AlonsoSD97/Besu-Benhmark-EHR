#!/bin/bash
n=3
echo "[BesuHosts]"
for ((i=1; i<=n; i++)) 
do
    echo "10.0.64.($i+2) ansible_user=alonso.salas hostname=node$i"
done
echo ""
echo "[BesuBotNodes]"
echo "10.0.64.2 ansible_user=alonso.salas"
