#!/bin/sh
# Kvrocks doesn't expand ${ENV} in its config file and rejects --requirepass
# on the command line, so the config is written here from REDIS_PASSWORD.
set -eu
: "${REDIS_PASSWORD:?REDIS_PASSWORD is required}"
DIR="${KVROCKS_DIR:-/var/lib/kvrocks}"
mkdir -p "$DIR"
rm -rf "$DIR/lost+found"
umask 077
{
  # IPv4 and IPv6: Railway's private network is IPv6.
  echo "bind 0.0.0.0 ::"
  echo "port 6379"
  echo "dir $DIR"
  printf 'requirepass %s\n' "$REDIS_PASSWORD"
} > "$DIR/kvrocks.conf"
exec kvrocks -c "$DIR/kvrocks.conf" --dir "$DIR"
