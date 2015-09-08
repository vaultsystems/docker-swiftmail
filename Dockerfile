FROM alpine:3.1
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>
RUN apk --update add python py-pip
RUN apk --update add --virtual build-dependencies build-base python-dev \
    && pip install python-keystoneclient python-swiftclient Flask waitress \
    && apk del build-dependencies
ADD swiftmail.py /
CMD python -u /swiftmail.py
