#!/usr/bin/env bash

chia start node

trap "chia stop all -d; exit 0" SIGINT SIGTERM

touch "$CHIA_ROOT/log/debug.log"
tail -F "$CHIA_ROOT/log/debug.log" &

while true; do sleep 1; done
