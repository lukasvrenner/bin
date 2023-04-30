#! /bin/sh
date=`date +%d-%m-%Y_%H:%M:%S`
file_name=~/Pictures/screenshots/capture@"$date".jpeg
chosen=$(printf "Area\nWindow\nScreen" | fuzzel -d)

case "$chosen" in
	"Area") grim -l 0 -g "$(slurp -d)" -o $file_name ;;
	"Window") grim -l 0 -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" -o $file_name ;;
    "Screen") grim ;;
	*) exit 1 ;;
esac
