#!/usr/bin/env bash

set -euxo pipefail

which xsv || (which cargo && cargo install xsv || (echo "Can't install xsv - do you have cargo?" && exit 1))

xsv join "lsoa_code" "lsoa_scores.csv" "lsoa" "postcodes.csv" | \
    xsv select "postcode","imd_decile" > postcode_deciles.csv
