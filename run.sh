#!/usr/bin/env bash
export FIREBASE_CREDS="$(cat private/fireacademy.json)"
# sudo certbot certonly -d *.fireacademy.io --manual
export SERVER_CRT="$(cat private/server.crt)"
export SERVER_KEY="$(cat private/server.key)"

docker run -e FIREBASE_CREDS="$(cat private/fireacademy.json)" -e SERVER_CRT="$(cat private/server.crt)" -e SERVER_KEY="$(cat private/server.key)" leaflet
