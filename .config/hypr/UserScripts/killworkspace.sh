#!/bin/bash

active_workspace=$(hyprctl -j activeworkspace | jq -r '.id')
addresses=$(hyprctl -j clients | jq -r ".[] | select(.workspace.id == $active_workspace) | .address")

for address in $addresses; do
  hyprctl dispatch closewindow address:$address
done
