FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

COPY config.xml /usr/share/doc/fahclient/sample-config.xml

RUN apt update && \
    apt install -y wget bzip2 python-stdeb python-gtk2 python-all debhelper procps

RUN wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb && \
    wget https://download.foldingathome.org/releases/public/release/fahcontrol/debian-stable-64bit/v7.5/fahcontrol_7.5.1-1_all.deb && \
    wget http://launchpadlibrarian.net/109052632/python-support_1.0.15_all.deb && \
    wget http://ftp.br.debian.org/debian/pool/main/p/pygtk/python-gtk2_2.24.0-5.1+b1_amd64.deb && \
    wget http://ftp.br.debian.org/debian/pool/main/g/gnome-python/python-gnome2_2.28.1+dfsg-1.2_amd64.deb && \
    dpkg -i --force-depends python-support_1.0.15_all.deb && \
    dpkg -i --force-depends python-gnome2_2.28.1+dfsg-1.2_amd64.deb && \
    dpkg -i --force-depends fahclient_7.5.1_amd64.deb && \
    dpkg -i --force-depends python-gtk2_2.24.0-5.1+b1_amd64.deb && \
    dpkg -i --force-depends fahcontrol_7.5.1-1_all.deb && \
    apt update && \
    apt install -y --fix-broken && \
    apt upgrade -y
    
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/etc/init.d/FAHClient -u Anonymous -v start; top -b"]

