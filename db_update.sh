#!/bin/sh

SERVER=mysql-db
USER=root
password=1
while read line;
do 
  key=${line%=*};val=${line#*=};
  if [ "$key" = "server" ]
  then
    SERVER=$val
  fi;
  if [ "$key" = "user" ]
  then
    USER=$val
  fi; 
  if [ "$key" = "password" ]
  then
    PASSWORD=$val
  fi;

done < /etc/bookstore/db.conf
echo "begin to update databse"
mysql -h $SERVER -u $USER --password=$PASSWORD < /opt/bookstore/db_update.sql >/tmp/db_update.log 2>&1
