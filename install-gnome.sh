set -euo pipefail
pacman -Sy --needed --noconfirm gnome gnome-extra dhclient iw dialog firefox
pacman -Sy --needed --noconfirm networkmanager network-manager-applet xf86-input-libinput
