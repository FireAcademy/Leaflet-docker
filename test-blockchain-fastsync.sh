#!/usr/bin/env bash

mv ./.chia ./.chia-old

mkdir ./.chia
mkdir ./.chia/mainnet
mkdir ./.chia/mainnet/db

cp ./.chia-old/mainnet/db/blockchain_v1_mainnet.sqlite ./.chia/mainnet/db/blockchain_v1_mainnet.sqlite

rm -rf ./.chia-old
