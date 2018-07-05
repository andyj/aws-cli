FROM alpine
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade pip && \
    pip install awscli --upgrade python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

ADD ./files/bash_profile.sh /root/.bash_profile

VOLUME /root/.aws
VOLUME /project
WORKDIR /project