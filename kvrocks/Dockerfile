# Apache Kvrocks: RAGFlow's cache, locks and task state (Redis protocol,
# stored on disk with RocksDB). Private network only. 2.16.0 is the version
# RAGFlow v1.0.0 pins (older tags break its run-tracker leases).
FROM apache/kvrocks:2.16.0@sha256:9e632c317c83c80d92f1c9d22ac6aa9f64d149e1f04ff2af5f15a5768a01c4b7

USER root
COPY --chmod=755 railway-start.sh /railway-start.sh
ENTRYPOINT ["/bin/sh", "/railway-start.sh"]
