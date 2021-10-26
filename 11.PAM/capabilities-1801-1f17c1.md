## Capabilities
Флаги (битовая маска) установки дополнительных прав на файлы и запущенные процессы, 
предоставляющие расширенные системные права  без использования suid (sudo)

В Linux каждый процесс (задача) имеет пять 64-битных чисел (наборов),
содержащих биты разрешений (до Linux 2.6.25 они были 32-битными), которые можно посмотреть в
/proc/<pid>/status

CapInh: 00000000000004c0
CapPrm: 00000000000004c0
CapEff: 00000000000004c0
CapBnd: 00000000000004c0
CapAmb: 0000000000000000



## Capabilities set  Для процесса
   - Permitted
        - требуется запрос на выполнение
    
   - Inheritable
        - можно унаследовать потомкам
    
   - Effective
        - какие действия может выполнить процесс
    
   - Bounding (ограничивающий набор) — до Linux 2.6.25 ограничивающий набор был общесистемным атрибутом, общим для всех потоков, предназначенным для описания набора, за пределы которого разрешения расширяться 
    не могут. В настоящее время это набор для каждой задачи и является лишь частью логики execve
    
   - Ambient (наружные, начиная с Linux 4.3) — добавлены, чтобы легче предоставлять разрешения
    не-root пользователю, без использования setuid или файловых разрешений 

## Capabilities set   Для файла
    - Permitted
        - разрешенный набор для файл
    
    - Inheritable
        - список свойст которые можно унаследовать от парента
    
    - Effective
        - бит разрешения для  permitted set


## Утилиты

- setcap
    - устанавливает и удаляет capabilities на исполняемый файл
    - setcap cap_net_admin,cap_net_raw+eip /usr/sbin/tcpdump
    - setcap -r /usr/bin/ping cap_net_raw
    
- getcap
    - узнать установленные capabilities
    - getcap /usr/sbin/tcpdump

## Capsh
утилита для тестирования установок capabilities 

```bash
su - vagrant
export -p > ./savedenv
sudo capsh --caps="cap_net_raw+eip cap_setpcap,cap_setuid,cap_setgid+ep" --keep=1 --user=vagrant  -- -c "source ./savedenv; rm ./savedenv; /usr/bin/env bash"
capsh --print
whoami
echo $$


```
---
```bash
[Unit]
Description=The Thumbor service
After=network.target

[Service]
Type=simple
Environment="AWS_CONFIG_FILE=/etc/thumbor/aws.conf"
User=thumbor
Group=thumbor

AmbientCapabilities=CAP_NET_BIND_SERVICE

ExecStart=/usr/local/bin/thumbor -p{{ thumbor_port }} -c /etc/thumbor/thumbor.conf -lDEBUG
ExecStop=/bin/kill -s KILL $MAINPID
PrivateTmp=true
RestartSec=20
Restart=on-failure

[Install]
WantedBy=multi-user.target
```