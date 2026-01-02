parted /dev/nvme0n1 mklabel gpt
parted /dev/nvme0n1 mkpart ESP fat32 1MiB 513iMB
parted /dev/nvme0n1 set 1 boot on
parted /dev/nvme0n1 mkpart primary ext2 514MiB 100%
parted /dev/nvme0n1 print  # check
