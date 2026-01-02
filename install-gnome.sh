set -euo pipefail
pacman -Sy --needed --noconfirm gnome gnome-extra dhclient iw dialog 
pacman -Sy --needed --noconfirm networkmanager network-manager-applet xf86-input-libinput
