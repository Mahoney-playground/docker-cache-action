#!/usr/bin/env bash

set -exuo pipefail

function main() {
  local event_name=$1
  local cache_tar=/tmp/docker_cache/cache.tar

  echo "Event name: [$event_name]"

  if [[ -f "$cache_tar" ]]; then
    ls -lh "$cache_tar"
    time sudo service docker stop
    time sudo mv /var/lib/docker /tmp/olddocker
    sudo mkdir -p /var/lib/docker
    time sudo tar -xf "$cache_tar" -C /var/lib/docker
    time sudo service docker start
  else
    docker system prune -a -f --volumes
  fi
}

main "$@"
