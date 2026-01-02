pvcreate /dev/mapper/luks0  # create the physical volume
vgcreate vg0 /dev/mapper/luks0  # create the volume group
lvcreate -L 8G vg0 -n swap  # create 8GB swap
lvcreate -l 100%FREE vg0 -n root  # assign the rest to root (/)
lvs  # check
