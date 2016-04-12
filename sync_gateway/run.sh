#!/bin/bash

main() {
  set +e
  set -o pipefail

  case "$1" in
  *)               sync_gateway https://gist.githubusercontent.com/Vranda2011/81f015a138a1a86d6f8f7e854743d25d/raw/94f6b61f738e2fd9bfde94588e1492dcd1822751/config.json;;
  esac
}

main "$@"
