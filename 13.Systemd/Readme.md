#  Инициализация системы. Systemd.

* [systemd.sh](https://github.com/maxonchikbk/otus/blob/main/13.Systemd/systemd.sh) - скрипт настройки
* [script.sh](https://github.com/maxonchikbk/otus/blob/main/13.Systemd/script.sh) - скрипт мониторинга
* [myunit.service](https://github.com/maxonchikbk/otus/blob/main/13.Systemd/myunit.service)
* [myunit.timer](https://github.com/maxonchikbk/otus/blob/main/13.Systemd/myunit.timer)
* [spawn-fcgi.service](https://github.com/maxonchikbk/otus/blob/main/13.Systemd/spawn-fcgi.service)
* [httpd@.service](https://github.com/maxonchikbk/otus/blob/main/13.Systemd/httpd@.service)

---
# Домашнее задание

Выполнить следующие задания и подготовить развёртывание результата выполнения с использованием Vagrant и Vagrant shell provisioner (или Ansible, на Ваше усмотрение):

1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig).
2. Из репозитория epel установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi).
3. Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.
