set -euo pipefail

DEV=/dev/nvme0n1p2
if cryptsetup isLuks $DEV; then
  cryptsetup erase $DEV
fi
cryptsetup luksFormat $DEV
cryptsetup open $DEV luks0
cryptsetup status luks0  # check
