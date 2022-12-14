FROM tomcat:latest
COPY ./webapp.war ./tomcat/webapps
