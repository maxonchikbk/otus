# Настраиваем split-dns
* [Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/22.DNS/Vagrantfile)
* [Ansible](https://github.com/maxonchikbk/otus/blob/main/22.DNS/playbook.yml)

Описание/Пошаговая инструкция выполнения домашнего задания:

1. взять стенд https://github.com/erlong15/vagrant-bind
2. добавить еще один сервер client2
3. завести в зоне dns.lab 
    * web1 - смотрит на клиент1
    * web2  смотрит на клиент2
4. завести еще одну зону newdns.lab
    * www - смотрит на обоих клиентов
5. настроить split-dns
    * клиент1 - видит обе зоны, но в зоне dns.lab только web1
    * клиент2 видит только dns.lab
* настроить все без выключения selinux

Формат сдачи ДЗ - vagrant + ansible
