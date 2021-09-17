#!/bin/bash
parted -s /dev/sda mktable msdos mkpart primary 1 100 set 1 boot on
mkfs.ext4 /dev/sda1
pvcreate /dev/sd{b..d}
vgcreate vg_root /dev/sd{b..d}
lvcreate -l 100%FREE -n root vg_root
mkfs.ext4 /dev/vg_root/root
mkdir /mnt/boot
mount /dev/vg_root/root /mnt/
mount /dev/sda1 /mnt/boot
pacstrap /mnt base linux lvm2 grub grub-customizer networkmanager dhcpcd mkinitcpio dkms 
genfstab -p -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash -e <<EOF
pacman -Syu lvm2 grub grub-customizer networkmanager openssh --noconfirm
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
sed -i 's/block filesystems/block lvm2 filesystems/g' /etc/mkinitcpio.conf
mkinitcpio -p linux
sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/\#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo -e "123\n123\n" | passwd
systemctl enable NetworkManager.service
systemctl enable dhcpcd.service
systemctl enable sshd.service
EOF
umount -R /mnt
reboot