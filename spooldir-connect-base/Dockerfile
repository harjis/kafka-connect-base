FROM d0rka/connect-base:latest

WORKDIR /spooldir-connect-base

RUN confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest

ENTRYPOINT ["/connect-base/entrypoint.sh"]
