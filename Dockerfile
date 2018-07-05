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

ADD ./files/s3search /usr/bin/s3search

RUN chmod a+x /usr/bin/s3search

VOLUME /root/.aws
VOLUME /project
WORKDIR /project
