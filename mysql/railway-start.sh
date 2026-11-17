#!/bin/bash
# Railway volumes come with a lost+found folder that MySQL's first-run init
# refuses ("data directory has files in it").
set -euo pipefail
: "${MYSQL_ROOT_PASSWORD:?MYSQL_ROOT_PASSWORD is required}"
rm -rf /var/lib/mysql/lost+found
# Same server settings as RAGFlow's docker-compose, with a smaller buffer pool.
exec docker-entrypoint.sh mysqld \
  --bind-address=* \
  --max_connections=1000 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_unicode_ci \
  --binlog_expire_logs_seconds=604800 \
  --innodb-buffer-pool-size=512M \
  --innodb-redo-log-capacity=512M \
  --max_allowed_packet=1073741824
