FROM ubuntu:14.04

MAINTAINER Matthew Tardiff <mattrix@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install \
       python-software-properties software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN add-apt-repository -y ppa:fkrull/deadsnakes

RUN apt-get update \
    && apt-get -y install \
       wget python-pip \
       python2.6 python2.7 python3.2 python3.3 python3.4 \
       pypy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /install
RUN wget -O /install/pypy3-2.4.0-linux64.tar.bz2 \
    https://bitbucket.org/pypy/pypy/downloads/pypy3-2.4.0-linux64.tar.bz2

RUN tar jxf /install/pypy3-2.4.0-linux64.tar.bz2 -C /install
RUN ln -s /install/pypy3-2.4.0-linux64/bin/pypy3 /usr/local/bin/pypy3

RUN pip install tox

RUN mkdir /app
WORKDIR /app
ADD requirements*.txt /app/
ADD tox.ini /app/tox.ini
RUN TOXSKIPSDIST=true TOXCOMMANDS=installonly tox

ADD . /app/

CMD ["tox"]
