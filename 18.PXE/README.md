#  DHCP, PXE 
* [Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/19.PXE/Vagrantfile)
* [Ansible](https://github.com/maxonchikbk/otus/blob/main/19.PXE/install.yml)
# Домашнее задание

Настройка PXE сервера для автоматической установки
1. Следуя шагам из документа https://docs.centos.org/en-US/8-docs/advanced-install/assembly_preparing-for-a-network-install установить и настроить загрузку по сети для дистрибутива CentOS8. В качестве шаблона воспользуйтесь репозиторием https://github.com/nixuser/virtlab/tree/main/centos_pxe.
2. Поменять установку из репозитория NFS на установку из репозитория HTTP.
3. Настройить автоматическую установку для созданного kickstart файла (*) Файл загружается по HTTP.

4. автоматизировать процесс установки Cobbler cледуя шагам из документа https://cobbler.github.io/quickstart/.

Критерии оценки:

Статус "Принято" ставится при выполнении следующих условий:

1. Ссылка на репозиторий github.
2. Vagrantfile с шагами установки необходимых компонентов
3. Исходный код scripts для настройки сервера (если необходимо)
4. Если какие-то шаги невозможно или сложно автоматизировать, то инструкции по ручным шагам для настройки

Задание со звездочкой выполняется по желанию.
