#! /bin/sh

chosen=$(printf "Power Off\nRestart\nSuspend\nHibernate\nLog Out\nLock" | fuzzel -d)

case "$chosen" in
	"Power Off") poweroff ;;
	"Restart") reboot ;;
	"Suspend") systemctl suspend ;;
	"Hibernate") systemctl hibernate ;;
	"Log Out") swaymsg exit ;;
	"Lock") swaylock ;;
	*) exit 1 ;;
esac
