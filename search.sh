#!/usr/bin/env bash
set -euxo pipefail

echo $1

which xsv || (which cargo && cargo install xsv || (echo "Missing cargo" && exit 1))

xsv search "^$1" postcode_deciles.csv | xsv select 2 | xsv stats | xsv select min,max,mean
