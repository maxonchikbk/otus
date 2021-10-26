setenforce 0
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
groupadd docker
groupadd admin
usermod -aG docker vagrant
usermod -aG admin vagrant
bash -c "sed -i 's/^PasswordAuthentication.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd.service"
echo "login;*;!admin;!Wd" >> /etc/security/time.conf
echo "account    required     pam_time.so" >> /etc/pam.d/sshd
cp /vagrant/1-manage-docker.rules  /etc/polkit-1/rules.d/