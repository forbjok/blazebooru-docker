#!/bin/bash

PG_VERSION=$(< /mnt/data/pgdata/PG_VERSION)

if [ "$PG_VERSION" -ge 18 ]; then
  PG_DATA_PATH="/mnt/db/$PG_VERSION/docker"
else
  PG_DATA_PATH="/mnt/db/data"
fi

cp -r /mnt/data/files/. /mnt/files/

mkdir -p "$PG_DATA_PATH"
cp -r /mnt/data/pgdata/. "$PG_DATA_PATH/"
