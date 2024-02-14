# Container image that runs your code
FROM ibm-semeru-runtimes:open-11.0.20.1_1-jdk-jammy

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app  &&\
  chmod 0777 /app

# Include v0.30.0 of the tool
RUN cd /app &&\
  wget -q -O /app/galasactl-0.30.0 https://github.com/galasa-dev/cli/releases/download/v0.30.0/galasactl-linux-x86_64 &&\
  mv galasactl-linux-x86_64 galasactl-0.30.0 &&\
  chmod +x galasactl-0.30.0

# Include v0.31.0 of the tool
RUN cd /app &&\
  wget -q -O /app/galasactl-0.31.0 https://github.com/galasa-dev/cli/releases/download/v0.31.0/galasactl-linux-x86_64 &&\
  mv galasactl-linux-x86_64 galasactl-0.31.0 &&\
  chmod +x galasactl-0.31.0

COPY entry-point.sh /app
RUN chmod +x /app/entry-point.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/app/entry-point.sh"]
