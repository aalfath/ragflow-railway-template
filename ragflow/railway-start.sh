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

# The image runs its database migration once at start and exits if MySQL isn't
# reachable yet. Railway starts all services at the same time, so wait for it.
for i in $(seq 1 120); do
  if timeout 3 bash -c 'exec 3<>"/dev/tcp/$0/$1"' "$MYSQL_HOST" "${MYSQL_PORT:-3306}" 2>/dev/null; then
    break
  fi
  [ "$i" = 1 ] && echo "railway-start: waiting for MySQL at ${MYSQL_HOST}:${MYSQL_PORT:-3306}..."
  sleep 3
done

cd /ragflow
exec ./entrypoint.sh "$@"
