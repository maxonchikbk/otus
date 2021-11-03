setenforce 0
yum install -y epel-release
yum install -y spawn-fcgi httpd
mv /vagrant/myunit.service /etc/systemd/system/
mv /vagrant/myunit.timer /etc/systemd/system/
mv /vagrant/myunit.ini /etc/sysconfig/
mv /vagrant/spawn-fcgi.service /etc/systemd/system/
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/1.conf
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/2.conf
sed -i 's/Listen 80/Listen 8081/' /etc/httpd/conf/1.conf
sed -i 's/Listen 80/Listen 8082/' /etc/httpd/conf/2.conf
echo "PidFile /var/run/httpd/httpd1.pid" >> /etc/httpd/conf/1.conf
echo "PidFile /var/run/httpd/httpd2.pid" >> /etc/httpd/conf/2.conf
systemctl start myunit.service
systemctl start httpd@1.service
systemctl start httpd@2.service