#!/bin/sh
# based on HexDSL's: https://gitlab.com/hexdsl/dots/tree/master/stow_home/bin/.bin
# uses wl-clipboard: https://github.com/bugaevc/wl-clipboard
# lists all configured keybindings and sends the command when selected

# prevent Xwayland from being started needlessly
chosen=$(grep bindsym ~/.config/sway/keybindings | egrep -v '\s?#' | \
	awk '{ printf "%-15s -> %s %s %s %s %s %s %s %s\n", \
	$2, $3, $4, $5, $6, $7, $8, $9, $10 }' | \
	fuzzel -d -p "Keybindings: " -i -l 8 -w 50)

# nothing selected
[ "$chosen" != "" ] || exit

# only keep the command itself
c=$(echo "$chosen" | sed 's/^\(.*\) --> \(.*\)$/\2/')
echo $c

# pop notification and execute command via swaymsg
notify-send "executing '${c}'." &
swaymsg "${c}"

