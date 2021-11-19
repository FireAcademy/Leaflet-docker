#!/usr/bin/env bash
./test-blockchain-fastsync.sh

export FIREBASE_CREDS="$(cat private/fireacademy.json)"
export SERVER_CRT="$(cat private/server.crt)"
export SERVER_KEY="$(cat private/server.key)"

docker run -v $(pwd)/.chia:/root/.chia -e FIREBASE_CREDS="$(cat private/fireacademy.json)" -e SERVER_CRT="$(cat private/server.crt)" -e SERVER_KEY="$(cat private/server.key)" leaflet
