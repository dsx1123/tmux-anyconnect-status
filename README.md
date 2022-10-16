# Tmux plugin to show anyconnect status

## Requirements
This plugin leverges vpn binary that is installed with anyconnect, vpn need be connected with vpn binary, NOT the anyconnect application
for example:
```
vpn connect sjc-vpn-cluster.cisco.com

Cisco AnyConnect Secure Mobility Client (version 4.10.05111) .

Copyright (c) 2004 - 2022 Cisco Systems, Inc.  All Rights Reserved.


  >> state: Connected
  >> state: Connected
  >> registered with local VPN subsystem.
  >> contacting host (sjc-vpn-cluster.cisco.com) for login information...
  >> state: Connected
  >> state: Connected
  >> notice: Connected to San Jose Duo - SSL.
  >> notice: Connected to San Jose Duo - SSL.
VPN>
```


## Install with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```tmux
set -g @plugin 'dsx1123/tmux-anyconnect-status'
set -g status-right '#{vpn_icon_status} #{vpn_status} #{vpn_session_duration}'
```


### Supported Format Strings
 - `#{vpn_status}` - status of the vpn connection
 - `#{vpn_icon_status}` - display a locked/unlocked icon based on the status
 - `#{vpn_session_duration}` - display the connection duration of the current session 

### Options
`#{vpn_bin}`

 - `@vpn_bin`: - `vpn` binary location, default value is `/opt/cisco/anyconnect/bin/vpn`

### License

[MIT](LICENSE)
