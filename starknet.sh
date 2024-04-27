#!/bin/bash

RPC_URL="https://rpc.starknet.lava.build/lava-referer-13b3d59e-d8e7-4dba-af86-8a693bba41f3/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

starknet_data=$(curl -A UA -x http://premium.proxywing.com:12321 --proxy-user d9hv1twu6q:rzld6kr3mb -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"starknet_blockNumber"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$starknet_data" >> "$OUTPUT_DIR/starknet.txt"
    
    echo "StarkNet data fetched and saved to $OUTPUT_DIR/starknet.txt."
else
    echo "Failed to fetch StarkNet data."
fi
