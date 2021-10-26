# Пользователи и группы. Авторизация и аутентификация 

* [script.sh](https://github.com/maxonchikbk/otus/blob/main/11.PAM/script.sh)

---
# Домашнее задание

* Запретить всем пользователям, кроме группы admin логин в выходные (суббота и воскресенье), без учета праздников
```
echo "login;*;!admin;!Wd" >> /etc/security/time.conf
echo "account    required     pam_time.so" >> /etc/pam.d/sshd
```
* Дать конкретному пользователю права работать с докером и возможность рестартить докер сервис
```
usermod -aG docker vagrant
```
```
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.systemd1.manage-units" &&
        action.lookup("unit") == "docker.service" &&
        subject.user == "vagrant") {
        return polkit.Result.YES;
    }
});
```
