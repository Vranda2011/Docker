#!/bin/bash

main() {
  set +e
  set -o pipefail

  case "$1" in
  *)               sync_gateway https://gist.githubusercontent.com/samhitha30/4a88a8686cbe1363ba2e61410e4b3ad5/raw/0c9da9df48dcea08c42f0601e8b500bdc49b2689/config.json;;
  esac
}

main "$@"
