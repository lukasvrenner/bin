#! /bin/sh

chosen=$(printf "Screenshot\nScreen Recording" | fuzzel -d)

case "$chosen" in
	"Screenshot") ~/bin/fuzzel/screenshot/image.sh ;;
	"Screen Recording") ~/bin/fuzzel/screenshot/video.sh ;;
	*) exit 1 ;;
esac
