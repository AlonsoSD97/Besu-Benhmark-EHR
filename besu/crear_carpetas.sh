#!/bin/bash

# Define the path where the folders will be created
path="./keys" # Change this path to your own path

# Create the main folder for Besu QBFT
mkdir -p $path

n=4
# Create subfolders for each node in the network
for ((i=1; i<=n; i++)) # Change this number to the number of nodes in your network
do
    mkdir -p $path/kesys/node$i # Create a folder for the keystore inside each node folder
done


# #run te node 2 in the same container

# sudo docker exec node1 besu --data-path=/besu_qbft/node1/data/ --genesis-file=/besu_qbft/genesis.json --bootnodes=<Node-1 Enode URL> --p2p-port=30304 --rpc-http-enabled --rpc-http-api=ETH,NET,QBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8546

#Enode URL enode://c879ee013509cf229583d26071f7fc6fa919d118b20824c34aa23b1403c8c38ff6db66b069259bf0b553e0ff480b107d53d64047ac80d108cbf2532cec3e5433@127.0.0.1:30303

