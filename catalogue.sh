echo -e "\e[36m>>>>>>>>>>>> create catalogue service<<<<<<<<<<<<\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/robodhop.log

echo -e "\e[36m>>>>>>>>>>>> create mongodb repo <<<<<<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/robodhop.log
echo -e "\e[36m>>>>>>>>>>>> install nodejs repos <<<<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/robodhop.log

echo -e "\e[36m>>>>>>>>>>>> install node js  <<<<<<<<<<<<\e[0m"
yum install nodejs -y &>>/tmp/robodhop.log
echo -e "\e[36m>>>>>>>>>>>> create application user <<<<<<<<<<<<\e[0m"
useradd roboshop &>>/tmp/robodhop.log

 echo -e "\e[36m>>>>>>>>>>>> remove directory of application  <<<<<<<<<<<<\e[0m"
rm -rf /app &>>/tmp/robodhop.log

echo -e "\e[36m>>>>>>>>>>>> create directory of application  <<<<<<<<<<<<\e[0m"
mkdir /app &>>/tmp/robodhop.log

echo -e "\e[36m>>>>>>>>>>>> download application content <<<<<<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/robodhop.log

echo -e "\e[36m>>>>>>>>>>>> extract  application content <<<<<<<<<<<<\e[0m" |
cd /app
unzip /tmp/catalogue.zip &>>/tmp/robodhop.log
cd /app


echo -e "\e[36m>>>>>>>>>>>> install nodejs dependencies <<<<<<<<<<<<\e[0m" |
npm install &>>/tmp/robodhop.log
echo -e "\e[36m>>>>>>>>>>>> install mongo client <<<<<<<<<<<<\e[0m" | tee -a /tmp/roboshop.log

yum install mongodb-org-shell -y &>>/tmp/robodhop.log
echo -e "\e[36m>>>>>>>>>>>> load catalogue schema <<<<<<<<<<<<\e[0m" | tee -a /tmp/roboshop.log
mongo --host mongodb.gorthivani.online</app/schema/catalogue.js &>>/tmp/robodhop.log

echo -e "\e[36m>>>>>>>>>>>> start catalogue service<<<<<<<<<<<\e[0m\e[0m" | tee -a /tmp/roboshop.log

systemctl daemon-reload &>>/tmp/robodhop.log
systemctl enable catalogue &>>/tmp/robodhop.log
systemctl restart catalogue &>>/tmp/robodhop.log