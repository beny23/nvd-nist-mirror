#!/bin/bash

mkdir -p feeds/json/cve/1.1
cd feeds/json/cve/1.1
curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-modified.meta -O
curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-modified.json.gz -O
for year in $(seq 2002 `date +%Y`)
do
	curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-$year.meta -O
	curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-$year.json.gz -O
done
