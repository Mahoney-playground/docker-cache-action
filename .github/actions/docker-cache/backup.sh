#!/usr/bin/env bash

set -exuo pipefail

function main {
  local cache_tar=$1
  local cache_dir
  cache_dir=$(dirname "$cache_tar")

  mkdir -p "$cache_dir"
  rm -f "$cache_tar"

  command time -f "Took %E" sudo service docker stop
  command time -f "Took %E" sudo /bin/tar -c -f "$cache_tar" -C /var/lib/docker .
  sudo chown "$USER:$(id -g -n "$USER")" "$cache_tar"
  ls -lh "$cache_tar"
}

main "$@"
