# set large font
setfont latarcyrheb-sun32

# set ntp
timedatectl set-ntp true

# set wifi
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect "ANROCA 2.4"
ping google.com  # check

# install git
pacman -Sy --needed --noconfirm git vim

# clone repo
cd /tmp
git clone http://tiny.cc/afparch -o arch-install # or https://tinyurl.com/4k3brdad
ls -lhatRr /tmp/arch-install  # check

# disk layout
bash -x /tmp/arch-install/disk-layout.sh

# set encryption
bash -x /tmp/arch-install/encrypt-disk.sh

# set lvm
bash -x /tmp/arch-install/lvm.sh

# format and mount
bash -x /tmp/arch-install/format-and-mount-disks.sh

# [OPTIONAL] set mirrors
bash -x /tmp/arch-install/dump-mirrorlist.sh
cat /etc/pacman.d/mirrorlist  # check

# increase parallel downloads
vim /etc/pacman.conf  # search for `ParallelDownloads`, change to 15

# install base
bash -x /tmp/arch-install/install-base.sh

# generate fstab
bash -x /tmp/arch-install/genfstab.sh

# enjail
arch-chroot /mnt

# clone again
cd /tmp
git clone http://tiny.cc/afparch -o arch-install

# set locale
vim /etc/locale.gen  # uncomment `en_US.UTF-8 UTF-8`
bash -x /tmp/arch-install/set-locale.sh
source /tmp/arch-install/locale.vars

# set timezone and hw clock
tzselect  # navigate through Americas > Brazil > Brazil (southeast: ...) > Yes
bash -x /tmp/arch-install/set-timezone.sh

# set vconsole and hostname
bash -x /tmp/arch-install/set-vconsole-and-hostname.sh

# generate initramfs
vim /etc/mkinitcpio.conf
# add `nvme` to MODULES: MODULES=(nvme)
# add `sd-encrypt lvm2` to HOOKS before `filesystems`: HOOKS=(...block sd-encrypt lvm2 filesystems...)
mkinitcpio -P  # generate initramfs for all installed kernels

# install microcode and bootloader
bash -x /tmp/arch-install/install-bootloader.sh

# set sudo
pacman -Sy sudo
EDITOR=vim visudo
# add: Defaults editor=/usr/bin/vim, !env_editor
# uncomment: %wheel ALL=(ALL) ALL

# create user
bash -x /tmp/arch-install/create-user.sh
echo "aprobst:*****" | chpasswd  # replace `*****` accordingly

# install gnome and a few extras
bash -x /tmp/arch-install/install-gnome.sh

# enable startup services
bash -x /tmp/arch-install/startup-services.sh
