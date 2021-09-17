# Загрузка системы 
## Попасть в систему без пароля несколькими способами.
1. CentOS 8: 
    ```
    1) Открыть параметры загрузки(е). Найти в строке "ro" и заменить на "rw init=/sysroot/bin/bash".
       После загрузки выполнить chroot /sysroot/
    2) Добавить rd.break в конец. Выполнить mount -o remount rw /sysroot и chroot /sysroot
    ```
2. Ubuntu 20 
    ```
    1) Открыть параметры заргузки. Открыть дополинтельные параметры и выбрать "режим восстановления". 
       Выбрать root. Выполнить mount -rw -o remount /
    2) Найти в строке "ro quiet splash $vt_handoff" и заменить на "rw init=/sysroot/bin/bash"
    ```
3. FreeBSD
    ```
    1) Выберать пункт «Boot in single user mode». Выполнить mount -u /
    2) Набрать boot -s в командной строке загрузчика. Выполнить mount -u /
    ```
Универсальный способ: загрузиться с образа и подмонтировать корневую систему.
---
## Установить систему с LVM, после чего переименовать VG
ArchLinux <br/>
[lvm-setup.sh](https://github.com/maxonchikbk/otus/blob/main/7.Boot/lvm-setup.sh) <br/>
[vg-rename.sh](https://github.com/maxonchikbk/otus/blob/main/7.Boot/vg-rename.sh) <br/>

## Добавить модуль в initrd.
[module.sh](https://github.com/maxonchikbk/otus/blob/main/7.Boot/module.sh)

# Домашнее задание

Работа с загрузчиком:

* Попасть в систему без пароля несколькими способами.
* Установить систему с LVM, после чего переименовать VG.
* Добавить модуль в initrd.

4(*). Сконфигурировать систему без отдельного раздела с /boot, а только с LVM <br/>
Репозиторий с пропатченым grub: https://yum.rumyantsev.com/centos/7/x86_64/ <br/>
PV необходимо инициализировать с параметром --bootloaderareasize 1m

Критерии оценки: <br/>
Описать действия, описать разницу между методами получения шелла в процессе загрузки. Где получится - используем script, где не получается - словами или копипастой описываем действия.
