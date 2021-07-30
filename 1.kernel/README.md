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
