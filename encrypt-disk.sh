set -euo pipefail

DEV=/dev/nvme0n1p2
[ cryptsetup isLuks $DEV ] \
  && cryptsetup erase $DEV
cryptsetup luksFormat $DEV
cryptsetup open $DEV luks0
cryptsetup status luks0  # check
