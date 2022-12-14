FROM tomcat:latest
RUN cp -R */tomcat/webapps.dist/* */tomcat/webapps
COPY ./*.war */tomcat/webapps
