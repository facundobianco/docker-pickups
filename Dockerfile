FROM debian:8.2
MAINTAINER Facundo Bianco < vando [at] van [dot] do >

ENV TERM xterm

ADD https://github.com/tdryer/hangups/archive/master.zip /usr/local/src/hangups.zip
#ADD https://github.com/mtomwing/pickups/archive/master.zip /usr/local/src/pickups.zip
ADD https://github.com/Zopieux/pickups/archive/master.zip /usr/local/src/pickups.zip

RUN echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates gcc openssl python3.4-dev python3.4-minimal python3-setuptools unzip

RUN ln -s /usr/bin/python3.4 /usr/bin/python
RUN for ZIP in hangups.zip pickups.zip ; do unzip /usr/local/src/${ZIP} -d /usr/local/src ; done
RUN cd /usr/local/src/hangups-master && python setup.py install
RUN cp -r /usr/local/src/pickups-master/pickups /usr/local/lib/python3.4/dist-packages
RUN mkdir -p /root/.cache/hangups

EXPOSE 6667
CMD ["/usr/bin/python", "-m", "pickups"]
