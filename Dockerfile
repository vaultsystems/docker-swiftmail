FROM ubuntu:trusty
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-swiftclient

ADD swift-upload.sh /usr/local/bin/

ENV OS_AUTH_URL=https://api.vaultsystems.com.au:5443/v2.0

CMD /usr/local/bin/swift-upload.sh