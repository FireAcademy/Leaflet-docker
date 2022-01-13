#!/usr/bin/env bash

chia start node

trap "chia stop all -d; exit 0" SIGINT SIGTERM

touch "$CHIA_ROOT/log/debug.log"
tail -F "$CHIA_ROOT/log/debug.log" &

cd /leaflet
REPORT_METRICS=1 npm start
