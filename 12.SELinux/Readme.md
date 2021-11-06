# SELinus

* [psax.sh](https://github.com/maxonchikbk/otus/blob/main/9.Proc/psax.sh)

## 1. Запустить nginx на нестандартном порту 3-мя разными способами:

```
[root@localhost vagrant]# audit2why </var/log/audit/audit.log
type=AVC msg=audit(1635955592.002:720): avc:  denied  { name_bind } for  pid=23628 comm="nginx" src=3252 scontext=system_u:system_r:httpd_t:s0 tcontext=system_u:object_r:unreserved_port_t:s0 tclass=tcp_socket permissive=0

        Was caused by:
        The boolean nis_enabled was set incorrectly.
        Description:
        Allow nis to enabled

        Allow access by executing:
        # setsebool -P nis_enabled 1
```        
- переключатели setsebool;

```
setsebool -P nis_enabled 1
```
- добавление нестандартного порта в имеющийся тип;
```
semanage port -a -t http_port_t -p tcp 3252
```
- формирование и установка модуля SELinux.
```
 audit2allow -M nginx_add --debug < /var/log/audit/audit.log
 semodule -i nginx_add.pp
```
```
[root@localhost vagrant]# audit2allow -M nginx_add --debug < /var/log/audit/audit.log
******************** IMPORTANT ***********************
To make this policy package active, execute:

semodule -i nginx_add.pp

[root@localhost vagrant]# ls
nginx_add.pp  nginx_add.te
```
## 2. Обеспечить работоспособность приложения при включенном selinux.
Запускаем на клиенте необходимую команду. Получаем ошибку. Переходим на ns01 запускаем __audit2why </var/log/audit/audit.log__ видим ошибку и генерируем модуль командой __audit2allow -M dns_add --debug < /var/log/audit/audit.log__. Устанавливаем модуль __semodule -i dns_add.pp__. 

```
[root@ns01 provisioning]# audit2why </var/log/audit/audit.log
type=AVC msg=audit(1635961306.458:2219): avc:  denied  { write } for  pid=6325 comm="isc-worker0000" name="named.ddns.lab.view1.jnl" dev="sda1" ino=67403793 scontext=system_u:system_r:named_t:s0 tcontext=system_u:object_r:etc_t:s0 tclass=file permissive=0

        Was caused by:
                Missing type enforcement (TE) allow rule.

                You can use audit2allow to generate a loadable module to allow this access.
```

---
# Домашнее задание

1. Запустить nginx на нестандартном порту 3-мя разными способами:

- переключатели setsebool;
- добавление нестандартного порта в имеющийся тип;
- формирование и установка модуля SELinux.

К сдаче:

README с описанием каждого решения (скриншоты и демонстрация приветствуются).

2. Обеспечить работоспособность приложения при включенном selinux.

* Развернуть приложенный стенд https://github.com/mbfx/otus-linux-adm/tree/master/selinux_dns_problems;
* Выяснить причину неработоспособности механизма обновления зоны (см. README);
* предложить решение (или решения) для данной проблемы;
* выбрать одно из решений для реализации, предварительно обосновав выбор;
* реализовать выбранное решение и продемонстрировать его работоспособность.

К сдаче:

README с анализом причины неработоспособности, возможными способами решения и обоснованием выбора одного из них;
исправленный стенд или демонстрация работоспособной системы скриншотами и описанием.

Критерии оценки:

Статус "Принято" ставится при выполнении следующих условий: 

    для задания 1 описаны, реализованы и продемонстрированы все 3 способа решения;
    для задания 2 описана причина неработоспособности механизма обновления зоны;
    для задания 2 реализован и продемонстрирован один из способов решения.

Опционально для выполнения:

    для задания 2 предложено более одного способа решения;
    для задания 2 обоснованно(!) выбран один из способов решения.

