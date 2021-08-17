# С чего начинается Linux
[Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/1.kernel/packer/Vagrantfile)

[Образ на Vagrant Cloud](https://app.vagrantup.com/maxonchik/boxes/centos-7-5)

Изменения оригинального репозитория: 
1) Убран "iso_checksum_type": "sha256"
2) Добавлен <up> в "boot_command", что бы не ждать каждый раз проверки
3) Блок 
```
 cat > /etc/sudoers.d/vagrant << EOF_sudoers_vagrant
 vagrant        ALL=(ALL)       NOPASSWD: ALL
 EOF_sudoers_vagrant
 
 ```
 заменён на 
```
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/vagrant
```

# Домашнее задание

Обновить ядро в базовой системе

Цель:

Студент получит навыки работы с Git, Vagrant, Packer и публикацией готовых образов в Vagrant Cloud.

В материалах к занятию есть методичка, в которой описана процедура обновления ядра из репозитория. По данной методичке требуется выполнить необходимые действия. Полученный в ходе выполнения ДЗ Vagrantfile должен быть залит в ваш git-репозиторий. Для проверки ДЗ необходимо прислать ссылку на него.

Для выполнения ДЗ со * и ** вам потребуется сборка ядра и модулей из исходников.
Критерии оценки:

Основное ДЗ - в репозитории есть рабочий Vagrantfile с вашим образом.

ДЗ со звездочкой: ядро собрано из исходников. ДЗ с **: в вашем образе нормально работают VirtualBox Shared Folders.
