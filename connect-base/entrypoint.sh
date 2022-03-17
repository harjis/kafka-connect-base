#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export CONNECT_URL="http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT"
export CONNECTORS_URL="$CONNECT_URL/connectors"

/etc/confluent/docker/run &
echo "Waiting for Kafka Connect to start listening on $CONNECT_URL ⏳"
while [[ $(curl -s -o /dev/null -w "%{http_code}" "$CONNECTORS_URL") -eq 000 ]]; do
  echo "Kafka Connect listener HTTP state: $(curl -s -o /dev/null -w "%{http_code}" "$CONNECTORS_URL") (waiting for 200)"
  sleep 5
done

# Sometimes creating the connector still fails even if it seems that REST endpoint is up.
# Let's wait some more...
# A better solution would have been to retry create-connectors.sh but with a quick try curl retries did not work
echo "Sleep 10 seconds to make sure REST really is up"
sleep 10
echo -e "\n--\n+> Creating Connectors"
./create-connectors.sh "$CONNECTORS_FILEPATH"
sleep infinity
