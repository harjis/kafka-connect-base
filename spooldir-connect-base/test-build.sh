#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker build \
  -t d0rka/connect-base \
  "$dir/../connect-base"

docker build \
  -t d0rka/spooldir-connect-base \
  "$dir"

# https://docs.docker.com/config/containers/container-networking/#ip-address-and-hostname
# hostname connect-base AND CONNECT_REST_ADVERTISED_HOST_NAME=connect-base need to match
docker run \
  --rm \
  --name connect-base \
  --hostname connect-base \
  --add-host=host.docker.internal:host-gateway \
  --env CONNECT_BOOTSTRAP_SERVERS=host.docker.internal:9093 \
  --env CONNECT_GROUP_ID=1 \
  --env CONNECT_CONFIG_STORAGE_TOPIC=my_connect_configs \
  --env CONNECT_OFFSET_STORAGE_TOPIC=my_connect_offsets \
  --env CONNECT_STATUS_STORAGE_TOPIC=my_source_connect_statuses \
  --env CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR=1 \
  --env CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR=1 \
  --env CONNECT_STATUS_STORAGE_REPLICATION_FACTOR=1 \
  --env CONNECT_KEY_CONVERTER=org.apache.kafka.connect.storage.StringConverter \
  --env CONNECT_VALUE_CONVERTER=org.apache.kafka.connect.storage.StringConverter \
  --env CONNECT_KEY_CONVERTER_SCHEMAS_ENABLE=false \
  --env CONNECT_VALUE_CONVERTER_SCHEMAS_ENABLE=false \
  --env CONNECT_REST_ADVERTISED_HOST_NAME=connect-base \
  --env CONNECT_REST_PORT=18083 \
  --env CONNECTORS_FILEPATH=/spooldir-connect-base/test/connectors/test-connectors.json \
  -v "$dir/test:/spooldir-connect-base/test" \
  -it \
  d0rka/spooldir-connect-base
