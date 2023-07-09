#! /bin/sh

chosen=$(printf "Power-saver\nBalanced\nPerformance" | fuzzel -d)

case "$chosen" in
	"Power-saver") powerprofilesctl set power-saver ;;
	"Balanced") powerprofilesctl set balanecd ;;
	"Performance") powerprofilesctl set performance ;;
	*) exit 1 ;;
esac
