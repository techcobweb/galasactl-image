# Container image that runs your code
FROM ibm-semeru-runtimes:open-11.0.20.1_1-jdk-jammy

ARG GALASACTL_VERSION

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /galasa  &&\
  chmod 0777 /galasa

COPY entry-point.sh /galasa
RUN chmod +x /galasa/entry-point.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/galasa/entry-point.sh"]

# Include the galasactl tool
RUN cd /galasa &&\
  wget -O galasactl https://github.com/galasa-dev/cli/releases/download/v${GALASACTL_VERSION}/galasactl-linux-x86_64 &&\
  chmod +x galasactl





