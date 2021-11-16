#  DHCP, PXE 
* [Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/19.PXE/Vagrantfile)
* [install.yml](https://github.com/maxonchikbk/otus/blob/main/19.PXE/install.yml)
# Домашнее задание

Настройка PXE сервера для автоматической установки
Цель:

Отрабатываем навыки установки и настройки DHCP, TFTP, PXE загрузчика и автоматической загрузки

    Следуя шагам из документа https://docs.centos.org/en-US/8-docs/advanced-install/assembly_preparing-for-a-network-install установить и настроить загрузку по сети для дистрибутива CentOS8. В качестве шаблона воспользуйтесь репозиторием https://github.com/nixuser/virtlab/tree/main/centos_pxe.
    Поменять установку из репозитория NFS на установку из репозитория HTTP.
    Настройить автоматическую установку для созданного kickstart файла (*) Файл загружается по HTTP.

        автоматизировать процесс установки Cobbler cледуя шагам из документа https://cobbler.github.io/quickstart/.

Формат сдачи ДЗ - vagrant + ansible
Критерии оценки:

Статус "Принято" ставится при выполнении следующих условий:

    Ссылка на репозиторий github.
    Vagrantfile с шагами установки необходимых компонентов
    Исходный код scripts для настройки сервера (если необходимо)
    Если какие-то шаги невозможно или сложно автоматизировать, то инструкции по ручным шагам для настройки

Задание со звездочкой выполняется по желанию.
