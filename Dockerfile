FROM ubuntu:trusty
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install python-swiftclient python-flask && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo Australia/Sydney > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

ADD swiftmail.py /

CMD python /swiftmail.py
