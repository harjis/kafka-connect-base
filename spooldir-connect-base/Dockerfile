ARG CONNECT_BASE_VERSION

FROM d0rka/connect-base:${CONNECT_BASE_VERSION}

WORKDIR /spooldir-connect-base

RUN confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest

ENTRYPOINT ["/connect-base/entrypoint.sh"]
