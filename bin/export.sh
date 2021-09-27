#!/bin/bash

# Make sure file exists and has API_TOKEN=<YOUR API TOKEN> inside
source credentials.txt



SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
UUID=$1
DASHBOARD=$2

if [ -z "$2" ]
  then
    DASHBOARD=$1
fi

curl -H "Authorization: Bearer $API_TOKEN" http://$HOST/api/dashboards/uid/$UUID > $SCRIPTPATH/../extras/dashboards/$DASHBOARD.json