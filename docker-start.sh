#!/usr/bin/env bash

ln -snf "/usr/share/zoneinfo/UTC" /etc/localtime && echo "UTC" > /etc/timezone

cd /chia-blockchain || exit 1

. ./activate

chia init --fix-ssl-permissions

chia keys generate
chia configure --upnp "false"
chia configure --log-level "INFO"

sed -i 's/localhost/127.0.0.1/g' "$CHIA_ROOT/config/config.yaml"
sed -i 's/log_stdout: true/log_stdout: false/g' "$CHIA_ROOT/config/config.yaml"

exec "$@"
