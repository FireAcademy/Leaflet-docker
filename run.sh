#!/usr/bin/env bash

./test-blockchain-fastsync.sh
docker run -v $(pwd)/.chia:/root/.chia leaflet
