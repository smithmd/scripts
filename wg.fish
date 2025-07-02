#!/usr/bin/env fish

cd $HOME/git/teleport

set TELEPORT_FILE "$HOME/.config/teleport.conf"


switch "$argv[1]"
  case connect c
    python main.py > $TELEPORT_FILE
    nmcli connection import --temporary type wireguard file $TELEPORT_FILE
    nmcli connection modify teleport connection.autoconnect no
  case disconnect d
    nmcli connection delete teleport
end

if test -e "$TELEPORT_FILE"
  rm $TELEPORT_FILE
end
