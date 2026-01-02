set -euo pipefail

umount -R /mnt
swapoff /dev/mapper/vg0-swap
reboot
