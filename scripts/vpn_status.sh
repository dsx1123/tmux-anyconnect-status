#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

main() {
    local status=$(vpn_state)
    echo $status
}

main
