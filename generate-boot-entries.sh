LUKS0_UUID=$(cryptsetup luksUUID /dev/nvme0n1p2)
cat /tmp/arch-install/boot/loader/entries/arch.conf \
  | sed "s/__UUID__/${LUKS0_UUID}/g" \
  > /boot/loader/entries/arch.conf
cat /tmp/arch-install/boot/loader/entries/arch-noresume.conf \
  | sed "s/__UUID__/${LUKS0_UUID}/g" \
  > /boot/loader/entries/arch-noresume.conf
