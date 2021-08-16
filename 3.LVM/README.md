#  Файловые системы и LVM 
[Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/3.LVM/vagrantfile)

[typescript](https://github.com/maxonchikbk/otus/blob/main/3.LVM/typescript.log)

# Домашнее задание

[Образ (centos/7 1804.2)](https://gitlab.com/otus_linux/stands-03-lvm) 

  * /dev/mapper/VolGroup00-LogVol00 38G 738M 37G 2% /
     - уменьшить том под / до 8G
     - выделить том под /home
     - выделить том под /var (/var - сделать в mirror)
     - для /home - сделать том для снэпшотов
     - прописать монтирование в fstab (попробовать с разными опциями и разными файловыми системами на выбор)
  *  Работа со снапшотами:
     - сгенерировать файлы в /home/
     - снять снэпшот
     - удалить часть файлов
     - восстановиться со снэпшота

  * (*)на этой куче дисков попробовать поставить btrfs/zfs:
     - с кешем и снэпшотами
     - разметить здесь каталог /opt

