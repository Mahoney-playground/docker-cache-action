#!/usr/bin/env bash

function timing() {
  command time -f "[$*] took %E" "$@"
}
