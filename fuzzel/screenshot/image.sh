#! /bin/sh

chosen=$(printf "Area\nWindow\nScreen" | fuzzel -d)

case "$chosen" in
	"Area") grim -g "$(slurp -d)" - | swappy -f - ;;
	"Window") grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" - | swappy -f - ;;
    "Screen") grim - | swappy -f - ;;
	*) exit 1 ;;
esac
