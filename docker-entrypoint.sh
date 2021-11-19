#!/usr/bin/env bash

ln -snf "/usr/share/zoneinfo/UTC" /etc/localtime && echo "UTC" > /etc/timezone

cd /leaflet/ssl || exit 1

echo "${SERVER_CRT}" > server.crt
echo "${SERVER_KEY}" > server.key

cd /chia-blockchain || exit 1

. ./activate

chia init --fix-ssl-permissions

chia keys generate
chia configure --upnp "false"
chia configure --log-level "INFO"

sed -i 's/localhost/127.0.0.1/g' "$CHIA_ROOT/config/config.yaml"
sed -i 's/log_stdout: true/log_stdout: false/g' "$CHIA_ROOT/config/config.yaml"
sed -i 's/target_outbound_peer_count: 8/target_outbound_peer_count: 20/g' "$CHIA_ROOT/config/config.yaml"
sed -i 's/max_inbound_wallet: 20/max_inbound_wallet: 42/g' "$CHIA_ROOT/config/config.yaml"

exec "$@"
