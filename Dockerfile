# Docker file for knowledge

FROM ubuntu:14.10

RUN apt-get update && apt-get install -y openjdk-8-jre-headless tomcat8 wget
RUN rm -rf /var/lib/tomcat8/webapps/ROOT
RUN wget -O /var/lib/tomcat8/webapps/ROOT.war https://github.com/support-project/knowledge/releases/download/0.4.1/knowledge.war
RUN mkdir /root/.knowledge
COPY setenv.sh /usr/share/tomcat8/bin/

VOLUME [ "/root/.knowledge" ]
EXPOSE 8080

CMD [ "/usr/share/tomcat8/bin/catalina.sh", "run" ]


