FROM ubuntu:14.04
ENV TERM xterm

COPY scripts/build-prepare scripts/build-cifs scripts/cleanup /tmp/build/

RUN /tmp/build/build-prepare && /tmp/build/build-cifs && /tmp/build/cleanup && \
    apt-get install -y libbsd-dev libcups2-dev  libldap2-dev  libpopt-dev && \
    mkdir -p /var/lib/run/ctdb /etc/samba/private_dir/ /var/log/samba && touch /etc/samba/private_dir/lockfile

COPY config/ctdb /etc/default/
COPY config/smb.conf /etc/samba/
COPY config/ctdb.sh /etc/init.d/ctdb
COPY config/nmbd config/samba config/samba-ad-dc config/smbd /etc/init.d/
CMD [""]
