FROM debian:8.2
MAINTAINER Facundo Bianco < vando [at] van [dot] do >

ENV TERM xterm

ADD https://github.com/tdryer/hangups/archive/master.tar.gz /usr/local/src/hangups.tgz
ADD https://github.com/mtomwing/pickups/archive/master.tar.gz /usr/local/src/pickups.tgz

RUN echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates gcc openssl python3.4-dev python3.4-minimal python3-setuptools

RUN ln -s /usr/bin/python3.4 /usr/bin/python
RUN for TGZ in hangups.tgz pickups.tgz ; do tar -C /usr/local/src -zxf /usr/local/src/${TGZ} ; done
RUN cd /usr/local/src/hangups-master && python setup.py install
RUN cp -r /usr/local/src/pickups-master/pickups /usr/local/lib/python3.4/dist-packages
RUN mkdir -p /root/.cache/hangups

EXPOSE 6667
CMD ["/usr/bin/python", "-m", "pickups", "--address", "0.0.0.0"]
