# NATS with JetStream: RAGFlow's ingestion queue. Streams are stored on the
# /data volume, so queued parsing tasks survive a restart. Private network only.
FROM nats:2.14.2@sha256:bbfbb6c4cdaeb8a2e3ca57d3de30463a66a6c5181f324f3b680bcf858833d377

ENV PORT=8222
# -a :: listens on IPv4 and IPv6. Port 8222 serves /healthz for Railway.
CMD ["-a", "::", "-p", "4222", "-js", "-sd", "/data", "--http_port", "8222"]
