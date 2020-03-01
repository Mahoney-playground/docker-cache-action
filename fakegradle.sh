#!/usr/bin/env bash

set -euo pipefail

if [[ ! -f ~/.gradle/build-dependency ]]; then
  touch ~/.gradle/build-dependency
  echo "*********************** UNCACHED BUILD ************************"
else
  echo "*********************** CACHED BUILD ************************"
fi
