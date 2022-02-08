# OSPF
* [Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/21.ospf/Vagrantfile)
* [ospf на frr](https://github.com/maxonchikbk/otus/blob/main/20.iptables/ospf.yml)
* [ассиметричный роутинг](https://github.com/maxonchikbk/otus/blob/main/20.iptables/asymmetric.yml)
* [симметричный дорогой](https://github.com/maxonchikbk/otus/blob/main/20.iptables/cost-symm.yml)

Описание/Пошаговая инструкция выполнения домашнего задания:

1. Поднять три виртуалки
2. Объединить их разными vlan

* поднять OSPF между машинами на базе Quagga;
* изобразить ассиметричный роутинг;
* сделать один из линков "дорогим", но что бы при этом роутинг был симметричным.

Формат сдачи: Vagrantfile + ansible
