# Dockerfile for Knowledge

FROM tomcat:jre8

# ==== dumb-init ====
ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64 \
      /usr/local/bin/dumb-init

# ==== environment ====
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
  && update-ca-certificates -f \
  && chmod +x /usr/local/bin/dumb-init

# ==== add Knowledge ====
ADD https://github.com/support-project/knowledge/releases/download/v1.7.0pre3/knowledge.war \
      /usr/local/tomcat/webapps/ROOT.war

VOLUME [ "/root/.knowledge" ]
EXPOSE 8080

CMD [ "/usr/local/bin/dumb-init", "/usr/local/tomcat/bin/catalina.sh", "run" ]
