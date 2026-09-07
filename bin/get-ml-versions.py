#!/usr/bin/env python3

import json
import requests

PM_URL="http://localhost:9090/api/v1/query"
PM_QUERY="mlservice_active[60m]"

data = json.loads(requests.get(PM_URL, params={"query": PM_QUERY}).content)['data']['result']

def get_host_version(host, data):
   data_filtered = list(filter(lambda x: x['host'] == host, data))
   host_version = max(data_filtered, key=lambda y: y['timestamp'])
   return host_version

def get_latest_datapoints(data):
   datapoints_latest = list(map(lambda x: 
      {
         "host": x['metric']['host'],
         "version": x['metric']['version'],
         "datacenter": x['metric']['datacenter'],
         "environment": x['metric']['environment'],
         "tenant": x['metric']['tenant'],
         "framework": x['metric']['framework'],
         "timestamp": x['values'][-1][0]
      }, data))
   return datapoints_latest
   
datapoints_latest = get_latest_datapoints(data)
host_list = set(list(map(lambda x: x['metric']['host'], data)))
versions_latest = list(map(lambda x: get_host_version(x, datapoints_latest), host_list)) 
print(json.dumps(versions_latest, indent=2))
