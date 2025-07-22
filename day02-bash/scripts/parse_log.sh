#!/usr/bin/env bash
set -euo pipefail

file="${1:-../sample.log}"

# number of ERROR lines
err_count=$(grep -c '^ERROR' "$file" || true)
echo "Errors: $err_count"

# unique users seen
echo "Users:"
awk '{for(i=1;i<=NF;i++) if($i ~ /^User=/){split($i,a,"="); print a[2]}}' "$file" | sort -u
