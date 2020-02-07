FROM python:3.5.9-alpine3.11

WORKDIR /app
COPY . .
RUN apk --no-cache add curl
RUN curl -# -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-279.0.0-linux-x86.tar.gz
RUN tar -zxvf google-cloud-sdk-279.0.0-linux-x86.tar.gz
RUN ./google-cloud-sdk/install.sh
RUN ./google-cloud-sdk/bin/gcloud auth activate-service-account --key-file /app/job/cron/google-service.json
CMD ["sh", "/app/job/cron/batch.sh"]