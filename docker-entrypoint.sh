#!/usr/bin/env bash

ln -snf "/usr/share/zoneinfo/UTC" /etc/localtime && echo "UTC" > /etc/timezone

if [ -z ${FASTSYNC_URL+x} ]; then
	echo "FastSync URL not set";
else 
	mkdir -p "$CHIA_ROOT/db";
	cd "$CHIA_ROOT/db";
	wget "${FASTSYNC_URL}" -O blockchain_v1_mainnet.sqlite.zip;
	unzip -o blockchain_v1_mainnet.sqlite.zip;
	rm blockchain_v1_mainnet.sqlite.zip;
fi


cd /chia-blockchain || exit 1

. ./activate

chia init --fix-ssl-permissions

# chia keys generate
chia configure --upnp "false"
chia configure --log-level "INFO"

sed -i 's/localhost/127.0.0.1/g' "$CHIA_ROOT/config/config.yaml"
sed -i 's/log_stdout: true/log_stdout: false/g' "$CHIA_ROOT/config/config.yaml"

exec "$@"
