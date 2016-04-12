#!/bin/bash

main() {
  set +e
  set -o pipefail

  case "$1" in
  *)               sync_gateway https://gist.githubusercontent.com/Vranda2011/81f015a138a1a86d6f8f7e854743d25d/raw/17322fd87592ef7f11c412a6700f96d669158d3b/config.json;;
  esac
}

main "$@"
