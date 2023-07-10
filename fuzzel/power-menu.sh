#! /bin/sh

chosen=$(printf "⏻  Power Off\n⟲  Restart\n  Suspend\n  Hibernate\n   Log Out\n  Lock" | fuzzel -d)

case "$chosen" in
	"⏻  Power Off") poweroff ;;
	"⟲  Restart") reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"   Log Out") swaymsg exit ;;
	"  Lock") ~/bin/swaylock/swaylock.sh ;;
	*) exit 1 ;;
esac
