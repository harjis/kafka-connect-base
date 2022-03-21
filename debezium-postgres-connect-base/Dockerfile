ARG CONNECT_BASE_VERSION

FROM d0rka/connect-base:${CONNECT_BASE_VERSION}

WORKDIR /debezium-postgres-connect-base

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest

ENTRYPOINT ["/connect-base/entrypoint.sh"]
