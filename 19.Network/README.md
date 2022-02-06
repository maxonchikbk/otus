# otus-linux
Vagrantfile - для стенда урока 9 - Network
* [Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/19.Network/Vagrantfile)
* [Ansible](https://github.com/maxonchikbk/otus/blob/main/19.Network/playbook.yml)
(https://github.com/maxonchikbk/otus/blob/main/19.Network/Map.png)
# Дано
Vagrantfile с начальным  построением сети: \
inetRouter \
centralRouter \
centralServer

# Планируемая архитектура
построить следующую архитектуру

Сеть office1
- 192.168.2.0/26      - dev
- 192.168.2.64/26    - test servers
- 192.168.2.128/26  - managers
- 192.168.2.192/26  - office hardware

Сеть office2
- 192.168.1.0/25      - dev
- 192.168.1.128/26  - test servers
- 192.168.1.192/26  - office hardware


Сеть central
- 192.168.0.0/28    - directors
- 192.168.0.32/28  - office hardware
- 192.168.0.64/26  - wifi

```
Office1 ---\
      -----> Central --IRouter --> internet
Office2----/
```
Итого должны получится следующие сервера:
- inetRouter
- centralRouter
- office1Router
- office2Router
- centralServer
- office1Server
- office2Server

### Теоретическая часть
- Найти свободные подсети
- Посчитать сколько узлов в каждой подсети, включая свободные
- Указать broadcast адрес для каждой подсети
- проверить нет ли ошибок при разбиении

### Практическая часть
- Соединить офисы в сеть согласно схеме и настроить роутинг
- Все сервера и роутеры должны ходить в инет черз inetRouter
- Все сервера должны видеть друг друга
- у всех новых серверов отключить дефолт на нат (eth0), который вагрант поднимает для связи
- при нехватке сетевых интервейсов добавить по несколько адресов на интерфейс
---
# Теоретическая часть

**Central**
Имя | Cеть | Всего | Broadcast
--- | --- | --- | ---
directors | 192.168.0.0/28 | 14 | 192.168.0.15
office hardware | 192.168.0.32/28 | 14 | 192.168.0.47
wifi | 192.168.0.64/26 | 62 | 192.168.0.127

**Office1**
Имя | Cеть | Всего | Broadcast
--- | --- | --- | ---
dev | 192.168.2.0/26 | 62 | 192.168.2.63
test servers | 192.168.2.64/26 | 62 | 192.168.2.127
managers | 192.168.2.128/26 | 62 | 192.168.2.191
office hardware | 192.168.2.192/26 | 62 | 192.168.2.255

**Office2**
Имя | Cеть | Всего | Broadcast
--- | --- | --- | ---
dev | 192.168.1.0/25 | 126 | 192.168.1.127
test servers | 192.168.1.128/26 | 62 | 192.168.1.191
office hardware | 192.168.1.192/26 | 62 | 192.168.1.255

Свободные сети есть только в Central: 192.168.0.16/28, 192.168.0.48/28 и 192.168.0.128/25

