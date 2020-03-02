#!/usr/bin/env bash

set -exuo pipefail

function main() {
  local cache_tar=~/docker_cache/cache.tar
  sudo mount

  if [[ -f "$cache_tar" ]]; then
    ls -lh "$cache_tar"
    time sudo service docker stop
    time sudo rm -rf /var/lib/docker/*
    time sudo tar -xf "$cache_tar" -C /var/lib/docker
    time sudo service docker start
  else
    docker system prune -a -f --volumes
  fi
}

main "$@"
