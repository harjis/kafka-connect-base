ARG CONNECT_BASE_VERSION

FROM d0rka/connect-base:${CONNECT_BASE_VERSION}

WORKDIR /jdbc-debezium-postgres-connect-base

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest

ENTRYPOINT ["/connect-base/entrypoint.sh"]
