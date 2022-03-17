FROM confluentinc/cp-kafka-connect-base:6.1.1

USER root
RUN yum -y install jq
USER appuser

WORKDIR /connect-base

RUN mkdir /connect-base/error && mkdir /connect-base/finished
COPY test/data/customers.json .
COPY test/data/orders.json .

RUN confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest

COPY ./create-connectors.sh ./create-connectors.sh
COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
