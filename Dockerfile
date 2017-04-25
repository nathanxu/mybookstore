FROM tomcat:7.0
ADD bookstore /usr/local/tomcat/webapps/bookstore
EXPOSE 8080
