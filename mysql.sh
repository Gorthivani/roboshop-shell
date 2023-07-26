mysql_root_password=$1
  if [ -z "${mysql_root_password}" ]; then
    echo input password missing
    exit 1
    fi
cp mysql.repo vim /etc/yum.repos.d/mysql.repo


yum module disable mysql -y
yum install mysql-community-server -y

systemctl enable mysqld
systemctl start mysqld
mysql_secure_installation --set-root-pass mysql_root_password
