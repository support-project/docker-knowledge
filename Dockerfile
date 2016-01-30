# Dockerfile for knowledge

FROM ubuntu:15.04

# ==== dumb-init ====
ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 \
      /usr/local/bin/dumb-init

# ==== environment ====
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
       apt-get install -y openjdk-8-jre-headless tomcat8 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/lib/tomcat8/webapps/ROOT \
  && update-ca-certificates -f \
  && chmod +x /usr/local/bin/dumb-init
ENV CATALINA_HOME=/usr/share/tomcat8 \
    CATALINA_BASE=/var/lib/tomcat8

# ==== add Knowledge ====
ADD https://github.com/support-project/knowledge/releases/download/v1.0.0/knowledge.war \
      /var/lib/tomcat8/webapps/ROOT.war

VOLUME [ "/root/.knowledge" ]
EXPOSE 8080

CMD [ "/usr/local/bin/dumb-init", "/usr/share/tomcat8/bin/catalina.sh", "run" ]
