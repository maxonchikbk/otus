# Строим бонды и вланы
Описание/Пошаговая инструкция выполнения домашнего задания:

В Office1 в тестовой подсети появляется сервера с доп интерфесами и адресами
в internal сети testLAN:

* testClient1 - 10.10.10.254
* testClient2 - 10.10.10.254
* testServer1- 10.10.10.1
* testServer2- 10.10.10.1

развести вланами
1. testClient1 <-> testServer1
2. testClient2 <-> testServer2

Между centralRouter и inetRouter
"пробросить" 2 линка (общая inernal сеть) и объединить их в бонд. Проверить работу c отключением интерфейсов

Формат сдачи ДЗ - vagrant + ansible
