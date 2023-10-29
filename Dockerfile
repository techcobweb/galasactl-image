# Container image that runs your code
FROM icr.io/galasadev/galasa-cli-amd64@sha256:636834ba9ff62db48c4e1e900e5052ce258aff9ce3c5a751c186c10928af6dc4

# RUN  apt-get update \
#   && apt-get install -y wget \
#   && rm -rf /var/lib/apt/lists/*
#
# RUN mkdir /app && \
#     wget -P /app https://github.com/galasa-dev/cli/releases/download/v0.30.0/galasactl-linux-x86_64 && \
#     mv /app/galasactl-linux-x86_64 /app/galasactl && \
#     chmod +x /app/galasactl

COPY entry-point.sh /galasa
RUN chmod +x /galasa/entry-point.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/galasa/entry-point.sh"]
