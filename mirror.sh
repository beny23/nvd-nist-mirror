#!/bin/bash -x

mkdir -p target/feeds/json/cve/2.0
(
  cd target/feeds/json/cve/2.0
  curl https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-modified.meta -OR --fail
  curl https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-modified.json.gz -OR --fail
  for year in $(seq 2002 `date +%Y`)
  do
    curl https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-$year.meta -OR --fail
    curl https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-$year.json.gz -OR --fail
  done
)

find target -type d -exec bash list-files.sh {} \;
