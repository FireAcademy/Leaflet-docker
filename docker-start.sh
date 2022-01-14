#!/usr/bin/env bash

chia start node

touch "$CHIA_ROOT/log/debug.log"

cd /leaflet
REPORT_METRICS=1 npm start
