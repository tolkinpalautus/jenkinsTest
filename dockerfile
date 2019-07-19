FROM consol/tomcat-8.0

ARG VERSION="0.1"

ENV LANG="C.UTF-8"

ADD sample.war /opt/tomcat/webapps/

#RUN curl "https://tomcat.apache.org/tomcat-8.0ample/sample.war" --output /opt/tomcat/webapps/sample.war && \
#    chmod 777 /opt/tomcat/webapps/sample.war
