# Сценарии iptables

* [Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/20.iptables/Vagrantfile)
* [Ansible](https://github.com/maxonchikbk/otus/blob/main/20.iptables/playbook.yml)

1. реализовать knocking port: 
centralRouter может попасть на ssh inetrRouter через knock скрипт пример в материалах.

2. добавить inetRouter2, который виден(маршрутизируется (host-only тип сети для виртуалки)) с хоста или форвардится порт через локалхост.
3. запустить nginx на centralServer.
4. пробросить 80й порт на inetRouter2 8080.
5. дефолт в инет оставить через inetRouter.
* реализовать проход на 80й порт без маскарадинга
