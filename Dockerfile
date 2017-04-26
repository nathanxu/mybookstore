FROM tomcat:7.0
ADD bookstore /usr/local/tomcat/webapps/bookstore
ADD agent /opt/agent
ADD catalina.sh /usr/local/tomcat/bin/catalina.sh
RUN chmod 755 /usr/local/tomcat/bin/catalina.sh
EXPOSE 8080
