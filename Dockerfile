# Container image that runs your code
FROM ibm-semeru-runtimes:open-11.0.20.1_1-jdk-jammy

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /galasa  &&\
  chmod 0777 /galasa

COPY entry-point.sh /galasa
RUN chmod +x /galasa/entry-point.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/galasa/entry-point.sh"]

# Include v0.30.0 of the tool
RUN cd /galasa &&\
  wget -O galasactl-0.30.0 https://github.com/galasa-dev/cli/releases/download/v0.30.0/galasactl-linux-x86_64 &&\
  chmod +x galasactl-0.30.0

# Include v0.31.0 of the tool
RUN cd /galasa &&\
  wget -O galasactl-0.31.0 https://github.com/galasa-dev/cli/releases/download/v0.31.0/galasactl-linux-x86_64 &&\
  chmod +x galasactl-0.31.0



