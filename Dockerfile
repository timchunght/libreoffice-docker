FROM ubuntu:14.04

MAINTAINER Timothy Chung <timchunght@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m libreoffice; \
    apt-get update \
    && apt-get install -y --no-install-recommends wget \
                                                  libdbus-glib-1-2 \
                                                  libsm6 \
                                                  openjdk-7-jre \
    && rm -rf /var/lib/apt/lists/*

ENV VERSION 5.1.6
ENV LIBREOFFICEPACKAGE LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz
ENV LIBREOFFICEDIR LibreOffice_${VERSION}.2_Linux_x86-64_deb

RUN wget -q http://download.documentfoundation.org/libreoffice/stable/$VERSION/deb/x86_64/$LIBREOFFICEPACKAGE -O /tmp/$LIBREOFFICEPACKAGE \
    && mkdir /tmp/LibreOffice \
    && tar -xzf /tmp/$LIBREOFFICEPACKAGE -C /tmp/LibreOffice \
    && dpkg -i /tmp/LibreOffice/$LIBREOFFICEDIR/DEBS/*.deb \
    && rm -f /tmp/$LIBREOFFICEPACKAGE \
    && rm -rf /tmp/LibreOffice

RUN mv /usr/bin/libreoffice* /usr/bin/libreoffice
