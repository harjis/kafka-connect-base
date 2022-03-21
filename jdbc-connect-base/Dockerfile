ARG CONNECT_BASE_VERSION

FROM d0rka/connect-base:${CONNECT_BASE_VERSION}

WORKDIR /jdbc-connect-base

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest

ENTRYPOINT ["/connect-base/entrypoint.sh"]
