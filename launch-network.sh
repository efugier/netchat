#!/bin/sh

mkfifo /tmp/launch.network.1
mkfifo /tmp/launch.network.2

cd $(dirname $0)

uxterm -e 'sh -c "cargo run -- --input /tmp/launch.network.1 --output /tmp/launch.network.2"' &
uxterm -e 'sh -c "cargo run -- --input /tmp/launch.network.2 --output /tmp/launch.network.1"' &

wait
