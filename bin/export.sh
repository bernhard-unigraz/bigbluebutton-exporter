#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
UUID=$1
DASHBOARD=$2
# Make sure file exists and has API_TOKEN=<YOUR API TOKEN> inside
source $SCRIPTPATH/credentials.txt
if [ -z "$2" ]
  then
    DASHBOARD=$1
fi

curl -H "Authorization: Bearer $API_TOKEN" http://$HOST/api/dashboards/uid/$UUID | json_pp -json_opt pretty,canonical > $SCRIPTPATH/../extras/dashboards/$DASHBOARD.json