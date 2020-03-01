#!/usr/bin/env bash

set -exuo pipefail

function main {
  local me
  me=$(whoami)
  local cache_dir=~/docker_cache
  local cache_tar="$cache_dir/cache.tar"
  mkdir -p "$cache_dir"
  rm -f "$cache_tar"

  sudo service docker stop
  sudo /bin/tar -c -f "$cache_tar" -C /var/lib/docker .
  sudo chown "$me:$me" "$cache_tar"
  sudo service docker start
}

main "$@"
