FROM    debian:stretch-slim

RUN     apt-get -qq update && \
        apt-get -qq install wget lsb-release gnupg2 && \
        wget -q https://repo.percona.com/apt/percona-release_latest.stretch_all.deb && \
        dpkg -i percona-release_latest.stretch_all.deb && \
        apt-get -qq update && \
        apt-get -qq install percona-xtrabackup-24 && \
        apt-get -qq purge wget && \
        apt-get -qq autoclean && apt-get -qq autoremove && rm -rf /tmp/* /var/cache/apt/* /var/cache/depconf/*

COPY    entrypoint.sh /entrypoint.sh
VOLUME  /var/backup/mysql

ENTRYPOINT [ "/entrypoint.sh" ]
