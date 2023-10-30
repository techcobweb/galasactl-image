# Container image that runs your code
FROM ibm-semeru-runtimes:open-11.0.20.1_1-jdk-jammy

ARG GALASACTL_VERSION 

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app 
RUN wget -P /app https://github.com/galasa-dev/cli/releases/download/v$GALASACTL_VERSION/galasactl-linux-x86_64
RUN mv /app/galasactl-linux-x86_64 /app/galasactl
RUN chmod +x /app/galasactl

COPY entry-point.sh /app
RUN chmod +x /app/entry-point.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/app/entry-point.sh"]
