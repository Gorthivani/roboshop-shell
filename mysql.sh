cp mysql.repo vim /etc/yum.repos.d/mysql.repo


yum module disable mysql -y
systemctl enable mysqld
systemctl start mysqld
mysql_secure_installation --set-root-pass RoboShop@1

