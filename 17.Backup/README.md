
# Резервное копирование 
Бекап запускается скриптом [backup.sh](https://github.com/maxonchikbk/otus/blob/main/17.Backup/backup.sh) <br>
Запуск по расписанию осуществляется через systemd timer [borgbackup.timer](https://github.com/maxonchikbk/otus/blob/main/17.Backup/borgbackup.timer) <br>
Просмотр логов через __journalctl -u borgbackup__ <br>
Восстановление в текующую директорию и выбранной копии выбранного файла: 
```
borg extract vagrant@server.local:/var/backup::{имя_копии} etc/{название файла}
```
```
[vagrant@client ~]$ sudo systemctl status borgbackup.service
● borgbackup.service - BorgBackup
   Loaded: loaded (/etc/systemd/system/borgbackup.service; disabled; vendor preset: disabled)
   Active: inactive (dead) since Sat 2021-11-06 20:02:07 UTC; 1min 30s ago
  Process: 21605 ExecStart=/bin/sh /vagrant/backup.sh (code=exited, status=0/SUCCESS)
 Main PID: 21605 (code=exited, status=0/SUCCESS)

Nov 06 20:02:06 client.local sh[21605]: Number of files: 416
Nov 06 20:02:06 client.local sh[21605]: Utilization of max. archive size: 0%
Nov 06 20:02:06 client.local sh[21605]: ------------------------------------------------------------------------------
Nov 06 20:02:06 client.local sh[21605]:                        Original size      Compressed size    Deduplicated size
Nov 06 20:02:06 client.local sh[21605]: This archive:               21.14 MB              8.11 MB              8.10 MB
Nov 06 20:02:06 client.local sh[21605]: All archives:               21.14 MB              8.11 MB              8.10 MB
Nov 06 20:02:06 client.local sh[21605]:                        Unique chunks         Total chunks
Nov 06 20:02:06 client.local sh[21605]: Chunk index:                     406                  414
Nov 06 20:02:06 client.local sh[21605]: ------------------------------------------------------------------------------
Nov 06 20:02:07 client.local systemd[1]: borgbackup.service: Succeeded.
[vagrant@client ~]$ sudo systemctl status borgbackup.timer
● borgbackup.timer - BorgBackup
   Loaded: loaded (/etc/systemd/system/borgbackup.timer; disabled; vendor preset: disabled)
   Active: active (waiting) since Sat 2021-11-06 20:02:02 UTC; 1min 38s ago
  Trigger: Sat 2021-11-06 20:07:02 UTC; 3min 21s left

Nov 06 20:02:02 client.local systemd[1]: Started BorgBackup.
[vagrant@client ~]$ sudo journalctl -u borgbackup
-- Logs begin at Sat 2021-11-06 20:00:45 UTC, end at Sat 2021-11-06 20:08:32 UTC. --
Nov 06 20:02:02 client.local systemd[1]: Started BorgBackup.
Nov 06 20:02:06 client.local sh[21605]: ------------------------------------------------------------------------------
Nov 06 20:02:06 client.local sh[21605]: Archive name: 20211106_200203
Nov 06 20:02:06 client.local sh[21605]: Archive fingerprint: de6556bac3ec959da91f092c86416379030fcfcbe30957428d43aa1ba229be14
Nov 06 20:02:06 client.local sh[21605]: Time (start): Sat, 2021-11-06 20:02:04
Nov 06 20:02:06 client.local sh[21605]: Time (end):   Sat, 2021-11-06 20:02:06
Nov 06 20:02:06 client.local sh[21605]: Duration: 1.59 seconds
Nov 06 20:02:06 client.local sh[21605]: Number of files: 416
Nov 06 20:02:06 client.local sh[21605]: Utilization of max. archive size: 0%
Nov 06 20:02:06 client.local sh[21605]: ------------------------------------------------------------------------------
Nov 06 20:02:06 client.local sh[21605]:                        Original size      Compressed size    Deduplicated size
Nov 06 20:02:06 client.local sh[21605]: This archive:               21.14 MB              8.11 MB              8.10 MB
Nov 06 20:02:06 client.local sh[21605]: All archives:               21.14 MB              8.11 MB              8.10 MB
Nov 06 20:02:06 client.local sh[21605]:                        Unique chunks         Total chunks
Nov 06 20:02:06 client.local sh[21605]: Chunk index:                     406                  414
Nov 06 20:02:06 client.local sh[21605]: ------------------------------------------------------------------------------
Nov 06 20:02:07 client.local systemd[1]: borgbackup.service: Succeeded.
Nov 06 20:07:41 client.local systemd[1]: Started BorgBackup.
Nov 06 20:07:42 client.local sh[23428]: ------------------------------------------------------------------------------
Nov 06 20:07:42 client.local sh[23428]: Archive name: 20211106_200741
Nov 06 20:07:42 client.local sh[23428]: Archive fingerprint: 7867c3d9679bcf34917494d16162bd6f5eaf119a0257f3ff402d8c6d204f5949
Nov 06 20:07:42 client.local sh[23428]: Time (start): Sat, 2021-11-06 20:07:41
Nov 06 20:07:42 client.local sh[23428]: Time (end):   Sat, 2021-11-06 20:07:42
Nov 06 20:07:42 client.local sh[23428]: Duration: 0.12 seconds
Nov 06 20:07:42 client.local sh[23428]: Number of files: 416
Nov 06 20:07:42 client.local sh[23428]: Utilization of max. archive size: 0%
Nov 06 20:07:42 client.local sh[23428]: ------------------------------------------------------------------------------
Nov 06 20:07:42 client.local sh[23428]:                        Original size      Compressed size    Deduplicated size
Nov 06 20:07:42 client.local sh[23428]: This archive:               21.14 MB              8.11 MB             47.08 kB
Nov 06 20:07:42 client.local sh[23428]: All archives:               42.29 MB             16.23 MB              8.15 MB
Nov 06 20:07:42 client.local sh[23428]:                        Unique chunks         Total chunks
Nov 06 20:07:42 client.local sh[23428]: Chunk index:                     409                  827
Nov 06 20:07:42 client.local sh[23428]: ------------------------------------------------------------------------------
Nov 06 20:07:43 client.local systemd[1]: borgbackup.service: Succeeded.
```
# Домашнее задание

1. Настроить стенд Vagrant с двумя виртуальными машинами: backup_server и client.

2. Настроить удаленный бекап каталога /etc c сервера client при помощи borgbackup. Резервные копии должны соответствовать следующим критериям:

    * директория для резервных копий /var/backup. Это должна быть отдельная точка монтирования. В данном случае для демонстрации размер не принципиален, достаточно будет и 2GB;
    * репозиторий дле резервных копий должен быть зашифрован ключом или паролем - на ваше усмотрение;
    * имя бекапа должно содержать информацию о времени снятия бекапа;
    * глубина бекапа должна быть год, хранить можно по последней копии на конец месяца, кроме последних трех. Последние три месяца должны содержать копии на каждый день. Т.е. должна быть правильно настроена политика удаления старых бэкапов;
    * резервная копия снимается каждые 5 минут. Такой частый запуск в целях демонстрации;
    * написан скрипт для снятия резервных копий. Скрипт запускается из соответствующей Cron джобы, либо systemd timer-а - на ваше усмотрение;
    * настроено логирование процесса бекапа. Для упрощения можно весь вывод перенаправлять в logger с соответствующим тегом. Если настроите не в syslog, то обязательна ротация логов.

3. Запустите стенд на 30 минут. Убедитесь что резервные копии снимаются. Остановите бекап, удалите (или переместите) директорию /etc и восстановите ее из бекапа. 

Для сдачи домашнего задания ожидаем настроенные стенд, логи процесса бэкапа и описание процесса восстановления. 
Формат сдачи ДЗ - vagrant + ansible
