#!/usr/bin/env bash

set -exuo pipefail

function main() {
  local cache_tar=$1

  if [[ -f "$cache_tar" ]]; then
    ls -lh "$cache_tar"
    time sudo service docker stop
    # mv is c. 25 seconds faster than rm -rf here
    time sudo mv /var/lib/docker "$(mktemp -d --dry-run)"
    sudo mkdir -p /var/lib/docker
    time sudo tar -xf "$cache_tar" -C /var/lib/docker
    time sudo service docker start
  else
    # Slim docker down - comes with 3GB of data we don't want to backup
    docker system prune -a -f --volumes
  fi
}

main "$@"
