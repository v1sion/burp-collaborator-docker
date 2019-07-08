FROM debian:latest

LABEL maintainer andremomorais

COPY config entrypoint.sh /opt/burp/

RUN apt-get update && apt-get install -y \
    default-jre \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -r collaborator \
    && useradd --no-log-init -r -g collaborator collaborator \
    && chown -R collaborator /opt/burp/

WORKDIR /opt/burp/

USER collaborator

ENTRYPOINT ["/opt/burp/entrypoint.sh"]