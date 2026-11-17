#!/usr/bin/env bash
# Checks the required settings, then hands over to the image's own entrypoint.
set -euo pipefail

for v in MYSQL_HOST MYSQL_PASSWORD MINIO_HOST MINIO_USER MINIO_PASSWORD \
         ES_HOST ELASTIC_PASSWORD KVROCKS_HOST REDIS_PASSWORD NATS_HOST \
         DEFAULT_SUPERUSER_PASSWORD; do
  if [ -z "${!v:-}" ]; then
    echo "railway-start: $v is not set. Check the service variables." >&2
    exit 1
  fi
done

# nginx in the image listens on port 80 only.
if [ "${PORT:-80}" != "80" ]; then
  echo "railway-start: PORT must be 80 (nginx listens on 80), got $PORT" >&2
  exit 1
fi

cd /ragflow
exec ./entrypoint.sh "$@"
