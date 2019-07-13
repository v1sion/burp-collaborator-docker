FROM debian:latest

LABEL maintainer andremomorais

ARG DOMAIN
ARG NS
ARG IP

COPY config/ entrypoint.sh /opt/burp/

RUN apt-get update && apt-get install -y \
    default-jre \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's/DOMAIN/'"${DOMAIN}"'/g; s/NS/'"${NS}"'/g; s/IP/'"${IP}"'/g' /opt/burp/burp.config \
    && groupadd -r collaborator \
    && useradd --no-log-init -r -g collaborator collaborator \
    && chown -R collaborator /opt/burp/

WORKDIR /opt/burp/

USER collaborator

ENTRYPOINT ["/opt/burp/entrypoint.sh"]