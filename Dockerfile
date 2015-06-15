FROM ubuntu:trusty
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install python-swiftclient python-flask && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sudo echo Australia/Sydney > /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

ADD swiftmail.py /

CMD python /swiftmail.py
