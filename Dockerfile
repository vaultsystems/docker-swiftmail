FROM alpine
MAINTAINER Christoph Dwertmann <christoph.dwertmann@vaultsystems.com.au>
RUN apk --update add python py-pip
RUN apk --update add --virtual build-dependencies gcc python-dev musl-dev tzdata \
    && pip install python-keystoneclient python-swiftclient Flask \
    && cp /usr/share/zoneinfo/Australia/Sydney /etc/localtime \
    && apk del build-dependencies

ADD swiftmail.py /
CMD python /swiftmail.py
