#!/bin/bash

GRAFANA_URL="http://10.10.10.10:3000"
API_TOKEN="your_api_token_here"  # Replace with your actual API token
EXPORT_DIR="./exported_dashboards"

mkdir -p "$EXPORT_DIR"
echo " Getting list of dashboards..."

curl -s -H "Authorization: Bearer $API_TOKEN" \
     "$GRAFANA_URL/api/search?type=dash-db" \
     | jq -c '.[]' \
     | while read DASH; do
       DASH_UID=$(echo "$DASH" | jq -r '.uid')
         TITLE=$(echo "$DASH" | jq -r '.title')


                 echo " Exporting: $TITLE (UID: $DASH_UID)"

                   curl -s -H "Authorization: Bearer $API_TOKEN" \
                          "$GRAFANA_URL/api/dashboards/uid/$DASH_UID" \
                            | jq '.dashboard' > "$EXPORT_DIR/${TITLE}.json"
                            done

                            echo " All dashboards exported to $EXPORT_DIR/"
