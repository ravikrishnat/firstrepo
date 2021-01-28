curl -XPOST -k -u elastic:Elastic@12345 https://elasticsearchnew.eastus.cloudapp.azure.com:9200/common_data_diageo_bkp/_search -H 'Content-Type: application/json' -d' { "aggs" : { "Closed" : { "date_histogram" : {"field" : "Closed","calendar_interval" : "month"},"aggs": {"Inc_type": {"terms": {"field": "Incident Type.keyword"}},"Closed_count": {"value_count": {"field": "Closed"} },"Closedby_count": {"cardinality": {"field": "Closed by.keyword"} }, "hat_vs_bag_ratio": { "bucket_script": {"buckets_path": {"hats": "Closed_count.value","bags": "Closedby_count.value"},"script": "params.hats / params.bags"}}}}}}'

added to test Azureboards connectivuty with github


