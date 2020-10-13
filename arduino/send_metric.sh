#!/bin/bash
curl -i -XPOST 'http://monitoring.berxa.cloudns.cl:8086/write?db=berxa_metrics' --data-binary "distance,pool=1 value=$1"