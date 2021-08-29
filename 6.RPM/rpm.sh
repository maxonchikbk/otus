yum install -y redhat-lsb-core rpmdevtools yum-utils gcc
rpm -i /vagrant/repo/nginx-1.20.1-1.el8.ngx.src.rpm
tar xof /root/rpmbuild/SOURCES/nginx-1.20.1.tar.gz -C /root/rpmbuild/SOURCES/        
rm -f /root/rpmbuild/SOURCES/nginx-1.20.1/html/index.html
/bin/cp -f /vagrant/www/* /root/rpmbuild/SOURCES/nginx-1.20.1/html/
mv -f /root/rpmbuild/SOURCES/nginx-1.20.1/html/nginx.default.conf /root/rpmbuild/SOURCES/nginx.default.conf
mv -f /root/rpmbuild/SOURCES/nginx-1.20.1/html/nginx.spec /root/rpmbuild/SPECS/nginx.spec
cd /root/rpmbuild/SOURCES/
tar cozf /root/rpmbuild/SOURCES/nginx-1.20.1.tar.gz nginx-1.20.1        
yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
yum install -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.1-1.el8.ngx.x86_64.rpm
systemctl start nginx

