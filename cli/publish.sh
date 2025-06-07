#!/bin/bash
NETWORK=$1

if [ -z "$NETWORK" ]; then
  echo "Usage: ./publish.sh <localnet|testnet|mainnet>"
  exit 1
fi

echo "🚀 Publishing to $NETWORK..."
sui client publish --path ../contracts --json --gas-budget 100000000 --network $NETWORK
