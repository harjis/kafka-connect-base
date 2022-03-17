FROM confluentinc/cp-kafka-connect-base:6.1.1

USER root
RUN yum -y install jq
USER appuser

WORKDIR /connect-base

COPY ./create-connectors.sh ./create-connectors.sh
COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
