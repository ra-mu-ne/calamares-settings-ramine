#!/bin/bash
set -e

echo "Calamares post-install script running..."

apt remove -y calamares squashfs-tools

mv /etc/apt/sources.list /etc/apt/sources.list.d/debian.list

cat /dev/null > /etc/apt/sources.list
cat <<EOF > "/etc/apt/sources.list" 
# This file is standard and contains nothing.
# Please fill in additional repositories in sources.list.d
#
# このファイルは標準で何も含まれていません。
# その他のリポジトリはsources.list.dに記入してください。
#
EOF

cat <<EOF > "/etc/apt/sources.list.d/debian.list"
# Debian stable
deb http://ftp.jp.debian.org/debian bookworm main contrib non-free non-free-firmware
deb-src http://ftp.jp.debian.org/debian bookworm main contrib non-free non-free-firmware

# Debian security
deb http://security.debian.org/ bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/ bookworm-security main contrib non-free non-free-firmware

# Debian updates
deb http://ftp.jp.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb-src http://ftp.jp.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
EOF

mv /etc/lightdm/lightdm.conf.bak /etc/lightdm/lightdm.conf

rm -rfv /etc/calamares

userdel -r live


