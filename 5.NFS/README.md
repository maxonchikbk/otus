# 5. NFS, FUSE

[Vagrantfile](https://github.com/maxonchikbk/otus/blob/main/5.NFS/vagrantfile)

[Config files](https://github.com/maxonchikbk/otus/blob/main/5.NFS/config)

[Server setup](https://github.com/maxonchikbk/otus/blob/main/5.NFS/setup_server.sh)

[Client setup](https://github.com/maxonchikbk/otus/blob/main/5.NFS/setup_client.sh)

# Домашнее задание
- Vagrant стенд для NFS:
   * vagrant up должен поднимать 2 виртуалки: сервер и клиент;
   * на сервер должна быть расшарена директория;
   * на клиента она должна автоматически монтироваться при старте (fstab или autofs);
   * в шаре должна быть папка upload с правами на запись;
- Требования для NFS: 
  * NFSv3: включенный firewall(по UDP)
  * NFSv4: Настроить аутентификацию через KERBEROS

