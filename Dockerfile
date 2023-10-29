# Container image that runs your code
FROM ubuntu:latest

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app && \
    wget -P /app https://github.com/galasa-dev/cli/releases/download/v0.30.0/galasactl-linux-x86_64 && \
    mv /app/galasactl-linux-x86_64 /app/galasactl && \
    chmod +x /app/galasactl

COPY entry-point.sh /galasa
RUN chmod +x /galasa/entry-point.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/galasa/entry-point.sh"]
