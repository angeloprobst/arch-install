set -euo pipefail

# install microcode
pacman -Sy --needed --noconfirm intel-ucode

# set bootloader (systemd-boot)
bootctl install --path=/boot
cp /tmp/arch-install/boot/loader/loader.conf /boot/loader
bash -x /tmp/arch-install/generate-boot-entries.sh
cat /boot/loader/entries/arch.conf  # check
cat /boot/loader/entries/arch-noresume.conf  # check
