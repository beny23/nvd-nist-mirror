#!/bin/bash
set -ex
mkdir -p target/feeds/json/cve/1.1
cd target/feeds/json/cve/1.1
curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-modified.meta -O --fail
curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-modified.json.gz -O --fail
for year in $(seq 2002 `date +%Y`)
do
	curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-$year.meta -O --fail
	curl https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-$year.json.gz -O --fail
done

find target -type d -exec bash list-files.sh {} \;