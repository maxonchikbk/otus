#!/bin/bash
echo -e "10.0.0.41 server \n10.0.0.41 server.otus.local \n10.0.0.41 otus.local \n10.0.0.40 client.otus.local \n10.0.0.40 client" >> /etc/hosts
/bin/cp -rf /vagrant/config/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

yum install -y nfs-utils krb5-server krb5-libs krb5-workstation

useradd krbuser
groupadd nfs_users
usermod -a -G nfs_users krbuser
mkdir /var/nfs
chmod ugo+rw /var/nfs/
mkdir /var/nfs/upload
chgrp nfs_users /var/nfs/upload
chmod 775 /var/nfs/upload

# NFS Server
systemctl start nfs-server.service && systemctl enable nfs-server.service
echo -e "/var/nfs/ *(rw) \n/tmp/ *(ro)">> /etc/exports
exportfs -rav

# Kerberos Server
/bin/cp -rf /vagrant/config/krb5.conf /etc/krb5.conf
/bin/cp -rf /vagrant/config/kdc.conf /var/kerberos/krb5kdc/kdc.conf
sed 's/EXAMPLE.COM/OTUS.LOCAL/g' /var/kerberos/krb5kdc/kadm5.acl
kdb5_util create -s -P 159753
kadmin.local -q "addprinc -pw 123 krbuser"
systemctl enable krb5kdc && systemctl start krb5kdc
systemctl enable kadmin && systemctl start kadmin
kadmin.local -q "addprinc -randkey host/server.otus.local"
kadmin.local -q "ktadd host/server.otus.local"
kadmin.local -q "addprinc -randkey host/client.otus.local"
kadmin.local -q "ktadd -k /tmp/client1.keytab host/client.otus.local"
kadmin.local -q "addprinc krbuser"
chmod 777 /tmp/client1.keytab

#Firewall
systemctl enable firewalld && systemctl start firewalld
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=mountd
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --permanent --add-service=kerberos 
firewall-cmd --reload