#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

readarray -t connectors < <(jq -c '.[]' "$1")
for connector in "${connectors[@]}"; do
  connector_name=$(echo "$connector" | jq -c -r '.name')
  echo "Creating Connector $connector_name"

  curl -s \
    -X "POST" "$CONNECTORS_URL" \
    -H "Content-Type: application/json" \
    -d "$connector"
done
