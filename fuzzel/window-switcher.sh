#!/bin/sh

# Get available windows
windows=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?)|recurse(.floating_nodes[]?)|select(.type=="con"),select(.type=="floating_con")|(.id|tostring)+" "+.app_id+": "+.name' | awk '{print " "$3" "$4" "$5" "$6" "$7}')
# Select window with rofi
selected=$(echo "$windows" | fuzzel -d | awk '{print $1}')

# Tell sway to focus said window
swaymsg [con_id="$selected"] focus

