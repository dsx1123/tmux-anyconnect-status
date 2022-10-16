#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

#icon values
icon_status_connected='🔒'
icon_status_disconnected='🔓'

print_icon_status() {
    state=$1
    if [[ $state =~ (^Connected) ]]; then
        printf $icon_status_connected
    elif [[ $state =~ (^Disconnected) ]]; then
        printf $icon_status_disconnected
    fi
}

main() {
    local status=$(vpn_state)
	print_icon_status "$status"
}
main
