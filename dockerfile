FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN set -ex && \
    apt-get update && \
    apt-get install -y xvfb \
                       openssl \
                       git \
                       python2 \
                       pkg-config \
                       build-essential \
                       autoconf \
                       libx11-dev \
                       libxcursor-dev \
                       libtasn1-6-dev \
                       nettle-dev \
                       libgnutls28-dev \
		       supervisor

COPY rootfs /

ENV DISPLAY=:99

RUN git clone https://github.com/fluzzi/rdesktop
RUN git clone https://github.com/fluzzi/rdp2tcp

RUN cp /rdp2tcp/oop-1.9.patch /rdesktop

WORKDIR /rdesktop

RUN patch < oop-1.9.patch
RUN aclocal
RUN autoconf
RUN ./configure --disable-credssp --disable-smartcard
RUN make
RUN make install

WORKDIR /rdp2tcp

RUN make client 

WORKDIR /

RUN mkdir /shared
RUN mkdir /log

COPY conf/supervisord.conf /etc/supervisord.conf

VOLUME ["/log", "/shared"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
