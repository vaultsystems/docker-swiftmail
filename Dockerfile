FROM ubuntu:trusty
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install python-swiftclient && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD swift-upload.sh /usr/local/bin/

CMD /usr/local/bin/swift-upload.sh
