#!/usr/bin/env bash

export LANG=C
export LC_ALL=C

vpn_bin_default="/opt/cisco/anyconnect/bin/vpn"

vpn_bin=""

get_tmux_option() {
  local option
  local default_value
  local option_value
  option="$1"
  default_value="$2"
  option_value="$(tmux show-option -qv "$option")"
  if [ -z "$option_value" ]; then
    option_value="$(tmux show-option -gqv "$option")"
  fi
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

is_osx() {
  [ "$(uname)" == "Darwin" ]
}

is_freebsd() {
  [ "$(uname)" == "FreeBSD" ]
}

is_openbsd() {
  [ "$(uname)" == "OpenBSD" ]
}

is_linux() {
  [ "$(uname)" == "Linux" ]
}

is_cygwin() {
  command -v WMIC &>/dev/null
}

get_option_values() {
    vpn_bin=$(get_tmux_option "@vpn_bin" "$vpn_bin_default")
}

vpn_state() {
    get_option_values
    local state=`$vpn_bin state | grep state | head -1 | tr ":" "\n" | tail -1 | xargs`
    echo $state
}

vpn_session_duration() {
    get_option_values
    local duration=`$vpn_bin stats | grep Duration | xargs | tr " " "\n" | tail -1 `
    echo $duration
}
