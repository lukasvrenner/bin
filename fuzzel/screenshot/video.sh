#! /bin/sh
date=`date +%d/%m/%Y_%H:%M:%S`
file_name=~/Pictures/screenshots/recording@"$date".mp4
chosen=$(printf "Area\nWindow\nScreen" | fuzzel -d -p 'Record: ')

case "$chosen" in
    "Area") wf-recorder -g "$(slurp)" -f $file_name ;;
	"Window") wf-recorder -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" -f $file_name ;;
    "Screen") wf-recorder -f $file_name ;;
	*) exit 1 ;;
esac
