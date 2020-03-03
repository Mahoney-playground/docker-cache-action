#!/usr/bin/env bash

function timing() {
  command time -f "Took %E" "$@"
}
