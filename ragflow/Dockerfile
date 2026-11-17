# RAGFlow (web UI, Go API server, admin server, ingestor and data syncer in one
# container). nginx inside the image serves the UI on port 80.
FROM infiniflow/ragflow:v1.0.0@sha256:ed8dff41a7530ed8fb037fe7479a7c535429d42fa8d00aec28b54bcbc056934d

# Fixed settings. Everything secret or service-specific comes from Railway
# variables (see README.md).
ENV DOC_ENGINE=elasticsearch \
    DB_TYPE=mysql \
    DEVICE=cpu \
    TZ=UTC \
    MYSQL_USER=root \
    MYSQL_PORT=3306 \
    MYSQL_DBNAME=rag_flow \
    MYSQL_MAX_PACKET=1073741824 \
    KVROCKS_PORT=6379 \
    NATS_PORT=4222 \
    ENABLE_REGISTER=0 \
    PORT=80

COPY --chmod=755 railway-start.sh /ragflow/railway-start.sh

ENTRYPOINT ["/ragflow/railway-start.sh"]
# --enable-adminserver runs the admin API (proxied at /api/v1/admin) and
# --init-superuser creates admin@ragflow.io on first start with
# DEFAULT_SUPERUSER_PASSWORD.
CMD ["--enable-adminserver", "--init-superuser"]
