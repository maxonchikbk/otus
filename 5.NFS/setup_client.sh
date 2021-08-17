#!/bin/bash
echo -e "10.0.0.41 server \n10.0.0.41 server.otus.local \n10.0.0.41 otus.local \n10.0.0.40 client.otus.local \n10.0.0.40 client" >> /etc/hosts
/bin/cp -rf /vagrant/config/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

yum install -y autofs krb5-workstation krb5-libs

useradd krbuser
groupadd nfs_users
usermod -a -G nfs_users krbuser
mkdir /mnt/nfs
mkdir /mnt/tmp

#NFS Setup
mount -t nfs4 10.0.0.41:/var/nfs /mnt/nfs
mount -t nfs4 10.0.0.41:/tmp /mnt/tmp
# echo 10.0.0.41:/var/nfs /mnt/nfs nfs4 0 0 >> /etc/fstab
echo -e "/mnt    /etc/auto.misc" >> /etc/auto.master
echo -e "tmp           -ro                     10.0.0.41:/tmp" >> /etc/auto.misc
echo -e "/-      /etc/auto.direct" >> /etc/auto.master
echo -e "/mnt/nfs           -rw                     10.0.0.41:/var/nfs" >> /etc/auto.direct
systemctl enable autofs && systemctl start autofs

#Kerberos Setup
/bin/cp -rf /mnt/tmp/client1.keytab /etc/krb5.keytab
/bin/cp -rf /vagrant/config/krb5.conf /etc/krb5.conf