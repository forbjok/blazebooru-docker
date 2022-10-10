#!/bin/bash

export SQLX_OFFLINE=true

# Build
cargo build --release

mkdir -p /blazebooru
cp ./target/x86_64-unknown-linux-musl/release/blazebooru_server /blazebooru/
