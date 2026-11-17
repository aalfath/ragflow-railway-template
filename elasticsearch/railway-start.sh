#!/bin/bash
# Railway volumes are owned by root; Elasticsearch runs as uid 1000.
set -euo pipefail
: "${ELASTIC_PASSWORD:?ELASTIC_PASSWORD is required}"
DATA=/usr/share/elasticsearch/data
mkdir -p "$DATA"
rm -rf "$DATA/lost+found"
chown -R 1000:0 "$DATA"
# --skip-chdir keeps the working directory, which the image entrypoint needs
# to add ELASTIC_PASSWORD to the keystore.
exec chroot --skip-chdir --userspec=1000:0 / env HOME=/usr/share/elasticsearch \
  /bin/tini -- /usr/local/bin/docker-entrypoint.sh eswrapper
