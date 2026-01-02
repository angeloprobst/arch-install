set -euo pipefail

mkfs.ext4 /dev/mapper/vg0-root
mkswap /dev/mapper/vg0-swap
mkfs.fat -F32 /dev/nvme0n1p1

mount /dev/mapper/vg0-root /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
swapon /dev/mapper/vg0-swap
