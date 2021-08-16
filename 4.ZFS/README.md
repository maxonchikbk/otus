# 1. Определить алгоритм с наилучшим сжатием

- zpool create mypool sdb sdc sdd \
for i in $(seq 1 4); do zfs create mypool/fs$i; done \
zpool status
```
pool: mypool
 state: ONLINE
  scan: none requested
config:

        NAME        STATE     READ WRITE CKSUM
        mypool      ONLINE       0     0     0
          sdb       ONLINE       0     0     0
          sdc       ONLINE       0     0     0
          sdd       ONLINE       0     0     0
```
- zfs list
```
NAME         USED  AVAIL     REFER  MOUNTPOINT
mypool       240K  2.69G     28.5K  /mypool
mypool/fs1    24K  2.69G       24K  /mypool/fs1
mypool/fs2    24K  2.69G       24K  /mypool/fs2
mypool/fs3    24K  2.69G       24K  /mypool/fs3
mypool/fs4    24K  2.69G       24K  /mypool/fs4
```
- zfs set compression=lz4 mypool/fs1 \
zfs set compression=gzip mypool/fs2 \
zfs set compression=gzip-9 mypool/fs3 \
zfs set compression=lzjb mypool/fs4 \
for i in $(seq 1 4); do cp /vagrant/War_and_Peace.txt /mypool/fs$i ; done

- zfs get compression,compressratio
```
NAME        PROPERTY       VALUE     SOURCE
mypool      compression    off       default
mypool      compressratio  1.92x     -
mypool/fs1  compression    lz4       local
mypool/fs1  compressratio  1.64x     -
mypool/fs2  compression    gzip      local
mypool/fs2  compressratio  2.69x     -
mypool/fs3  compression    gzip-9    local
mypool/fs3  compressratio  2.70x     -
mypool/fs4  compression    lzjb      local
mypool/fs4  compressratio  1.37x     -
```
# 2. Определить настройки pool’a

- tar -xf zfs_task1.tar.gz
```
 zpool import -d zpoolexport/
   pool: otus
     id: 6554193320433390805
  state: ONLINE
 action: The pool can be imported using its name or numeric identifier.
 config:

        otus                            ONLINE
          mirror-0                      ONLINE
            /vagrant/zpoolexport/filea  ONLINE
            /vagrant/zpoolexport/fileb  ONLINE
```
- zpool import -d zpoolexport/ otus \
 zpool list
```  
NAME     SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOT
otus     480M  2.09M   478M        -         -     0%     0%  1.00x    ONLINE  -
```
- zfs get recordsize,compression,checksum | grep -i otus
```
otus            recordsize   128K       local
otus            compression  zle        local
otus            checksum     sha256     local
otus/hometask2  recordsize   128K       inherited from otus
otus/hometask2  compression  zle        inherited from otus
otus/hometask2  checksum     sha256     inherited from otus
```

Параметр | Значение 
--- | ---: 
Размер хранилища|480M
тип pool|mirror
значение recordsize|128K
какое сжатие используется|zle
какая контрольная сумма используется|sha256

# 3. Найти сообщение от преподавателей
- zfs receive otus/hometask3 < otus_task2.file \
find /otus/hometask3/ -name se* 
```
/otus/hometask3/task1/file_mess/secret_message
```
- cat /otus/hometask3/task1/file_mess/secret_message
```
https://github.com/sindresorhus/awesome
```