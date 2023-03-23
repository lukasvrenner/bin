#! /bin/sh

chosen=$(printf "⏻  Power Off\n⟲  Restart\n  Suspend\n  Hibernate\n  Log Out\n🔒  Lock" | fuzzel -d)

case "$chosen" in
	"⏻  Power Off") poweroff ;;
	"⟲  Restart") reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"  Log Out") swaymasg exit ;;
	"🔒  Lock") ~/.config/sway/swaylock.sh ;;
	*) exit 1 ;;
esac
