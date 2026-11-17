# Elasticsearch: RAGFlow's document engine (full-text and vector search over
# the chunks of your documents). Single node, password auth on (user
# "elastic"), private network only. 8.11.3 is the version RAGFlow v1.0.0 pins.
FROM elasticsearch:8.11.3@sha256:58a3a280935d830215802322e9a0373faaacdfd646477aa7e718939c2f29292a

USER root
COPY --chown=1000:0 elasticsearch.yml roles.yml /usr/share/elasticsearch/config/
COPY --chmod=755 railway-start.sh /railway-start.sh

ENV ES_JAVA_OPTS="-Xms1g -Xmx1g" \
    PORT=9200

ENTRYPOINT ["/railway-start.sh"]
