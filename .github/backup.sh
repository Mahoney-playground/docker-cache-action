#!/usr/bin/env bash

set -exuo pipefail

function main {
  local me
  me=$(whoami)
  local cache_dir=/tmp/docker_cache
  local cache_tar="$cache_dir/cache.tar"
  mkdir -p "$cache_dir"
  rm -f "$cache_tar"

  time sudo service docker stop
  time sudo /bin/tar -c -f "$cache_tar" -C /var/lib/docker .
  sudo chown "$me:$me" "$cache_tar"
  ls -lh "$cache_tar"
}

main "$@"
