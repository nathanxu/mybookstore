#!/bin/bash

SERVER=mysql-db
USER=root
PASSWORD=1
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
echo "mysql -h $SERVER -u $USER --password=$PASSWORD"
mysql -h $SERVER -u $USER --password=$PASSWORD < /opt/bookstore/db_update.sql
while :
do
  sleep 120
done
