FROM ubuntu:16.04 AS builder

LABEL description="geoipupdate installed in Ubuntu Xenial Xerus"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DE742AFA && \
    echo "deb http://ppa.launchpad.net/maxmind/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/maxmind.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y geoipupdate && \
    apt-get -qy autoremove && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/bin/geoipupdate" ]
CMD [ "-v" ]
