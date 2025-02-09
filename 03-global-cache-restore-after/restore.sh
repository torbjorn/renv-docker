#!/bin/bash

set -euf -o pipefail
shopt -s nullglob

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BASEDIR="$SCRIPT_DIR/."

# restore R packages
pushd "$BASEDIR" >/dev/null
set +e
echo -n "Restoring R packages..."
R -e 'renv::restore()'
echo "done"
set -e
popd >/dev/null
