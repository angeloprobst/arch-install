cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 luks0
cryptsetup status luks0  # check
