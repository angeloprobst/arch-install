backup_file=/etc/pacman.d/mirrorlist.bak
[ ! -e "${backup_file}" ] \
  && mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
curl -s \
  'https://archlinux.org/mirrorlist/?country=BR&protocol=https&ip_version=4&ip_version=6' \
  | grep -E '(cicku|ufscar|unicamp)' \
  | sed 's/#Server/Server/' \
  > /etc/pacman.d/mirrorlist
