FROM ubuntu:24.04

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

RUN set -x; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    software-properties-common \
    certbot \
    python3-certbot-nginx \
    curl \
    jq \
    gpg

RUN set -x; \
    mkdir -p /etc/letsencrypt

COPY secret-patch-template.json /
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
