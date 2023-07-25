source common.sh
log=/tmp/roboshop.log
 echo -e "\e[36m>>>>>>>>>>>> install inginx <<<<<<<<<<<<\e[0m"
yum install nginx -y &>>${log}
func_exit_status

 echo -e "\e[36m>>>>>>>>>>>> copy roboshop configuration <<<<<<<<<<<<\e[0m"
cp nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf &>>${log}
func_exit_status

 echo -e "\e[36m>>>>>>>>>>>> clean old conetnt <<<<<<<<<<<<\e[0m"
rm -rf /usr/share/nginx/html/* &>>${log}
func_exit_status

 echo -e "\e[36m>>>>>>>>>>>> download application content <<<<<<<<<<<<\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log}

 func_exit_status


cd /usr/share/nginx/html &>>${log}

 echo -e "\e[36m>>>>>>>>>>>> extract application conent <<<<<<<<<<<<\e[0m"
unzip /tmp/frontend.zip &>>${log}
 func_exit_status
 echo -e "\e[36m>>>>>>>>>>>>  start service<<<<<<<<<<<<\e[0m"
systemctl enable nginx
systemctl restart nginx
 func_exit_status
