pvcreate /dev/sdb
vgcreate vg_root /dev/sdb
lvcreate -n lv_root -l +100%FREE /dev/vg_root
mkfs.xfs /dev/vg_root/lv_root
mount /dev/vg_root/lv_root /mnt
xfsdump -J - /dev/VolGroup00/LogVol00 | xfsrestore -J - /mnt
for i in /proc/ /sys/ /dev/ /run/ /boot/; do mount --bind $i /mnt/$i; done
chroot /mnt /bin/bash <<EOF
grub2-mkconfig -o /boot/grub2/grub.cfg
cd /boot; dracut -v initramfs-3.10.0-862.2.3.el7.x86_64.img 3.10.0-862.2.3.el7.x86_64 --force;
sed -i 's/d.lvm.lv=VolGroup00\/LogVol00/d.lvm.lv=vg_root\/lv_root/g' /boot/grub2/grub.cfg  
EOF
reboot
# cat /boot/grub2/grub.cfg | grep -i rd.lvm.lv
