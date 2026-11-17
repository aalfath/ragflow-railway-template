# Object storage for uploaded files: pgsty/silo, the maintained MinIO build that
# RAGFlow v1.0.0's own docker-compose uses (MinIO no longer publishes images).
# S3 API on port 9000, private network only. Data lives on the /data volume.
FROM pgsty/silo:RELEASE.2026-08-06T00-00-00Z@sha256:29a498b24669cae1fed11c1a2fb2b3d73c68829a0a9c0b14e71b386671d38fac

ENV PORT=9000
CMD ["server", "--address", ":9000", "--console-address", ":9001", "/data"]
