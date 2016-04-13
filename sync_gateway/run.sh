#!/bin/bash

main() {
  set +e
  set -o pipefail

  case "$1" in
  *)               sync_gateway https://gist.githubusercontent.com/Vranda2011/81f015a138a1a86d6f8f7e854743d25d/raw/047c32c99323fb86374df355bf5099434deab478/config.json;;
  esac
}

main "$@"
