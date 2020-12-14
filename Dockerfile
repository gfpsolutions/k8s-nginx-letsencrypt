FROM fedora:24

RUN dnf install certbot -y && dnf clean all
RUN mkdir /etc/letsencrypt

COPY secret-patch-template.json /
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]