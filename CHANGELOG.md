# Changelog

Breaking changes are listed first in each entry. Read the entry before you apply an update from Railway.

## 2026-11-17: RAGFlow v1.0.0 (first release)

- RAGFlow `infiniflow/ragflow:v1.0.0@sha256:ed8dff41a7530ed8fb037fe7479a7c535429d42fa8d00aec28b54bcbc056934d`
- Elasticsearch `elasticsearch:8.11.3@sha256:58a3a280935d830215802322e9a0373faaacdfd646477aa7e718939c2f29292a`
- MinIO (Silo) `pgsty/silo:RELEASE.2026-08-06T00-00-00Z@sha256:29a498b24669cae1fed11c1a2fb2b3d73c68829a0a9c0b14e71b386671d38fac`
- MySQL `mysql:8.4.13@sha256:a81d043930e51745522bd5c430961cf8286f0a23f0a9a2a6e0108f7ea71b0902`
- Kvrocks `apache/kvrocks:2.16.0@sha256:9e632c317c83c80d92f1c9d22ac6aa9f64d149e1f04ff2af5f15a5768a01c4b7`
- NATS `nats:2.14.2@sha256:bbfbb6c4cdaeb8a2e3ca57d3de30463a66a6c5181f324f3b680bcf858833d377`
- The RAGFlow service waits up to 6 minutes for MySQL before its one-time database migration, so a fresh deploy doesn't crash while MySQL is still starting.
