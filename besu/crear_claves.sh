#!/bin/bash

CONFIG_FILE="qbft-genesis-generator.json"
OUTPUT_DIR="keys"
PRIVATE_KEY_FILE_NAME="key"

besu operator generate-blockchain-config --config-file="$CONFIG_FILE" --to="$OUTPUT_DIR" --private-key-file-name="$PRIVATE_KEY_FILE_NAME"


#Rename subfolders in keys/keys to node_i
i=1
for dir in "$OUTPUT_DIR"/keys/*; do
    if [ -d "$dir" ]; then
        new_dir="${dir%/*}/node_${i/}"
        mv "$dir" "$new_dir"
        ((i=i+1))
    fi
done
# Rename subfolders in keys/keys to node_key
# for dir in "$OUTPUT_DIR"/keys/*; do
#     if [ -d "$dir" ]; then
#         new_dir="${dir%/*}/node_${dir##*/}"
#         mv "$dir" "$new_dir"
#     fi
# done
