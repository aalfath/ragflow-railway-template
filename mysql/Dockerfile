# MySQL 8.4 LTS: RAGFlow's metadata database (users, knowledge bases, documents,
# chats). Data lives on the /var/lib/mysql volume. Private network only.
FROM mysql:8.4.13@sha256:a81d043930e51745522bd5c430961cf8286f0a23f0a9a2a6e0108f7ea71b0902

COPY init.sql /docker-entrypoint-initdb.d/00-ragflow.sql
COPY --chmod=755 railway-start.sh /railway-start.sh
ENTRYPOINT ["/railway-start.sh"]
