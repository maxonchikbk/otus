#!/bin/bash
vgrename /dev/vg_root /dev/vg
sed -i 's!mapper/vg_root!mapper/vg!g' /boot/grub/grub.cfg /etc/fstab
reboot
