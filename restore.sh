#!/usr/bin/env bash

set -exuo pipefail

function main() {
  local cache_tar="/tmp/docker_cache/cache.tgz"

  if [[ -f "$cache_tar" ]]; then
    sudo service docker stop
    sudo rm -rf /var/lib/docker
    sudo mkdir -p /var/lib/docker
    sudo tar -zxf "$cache_tar" -C /var/lib/docker
    sudo service docker start
  fi
}

main "$@"
