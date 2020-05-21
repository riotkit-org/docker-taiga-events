ARG NODE_VERSION=12.16.3
ARG ALPINE_VERSION=3.11

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}
MAINTAINER RiotKit <riotkit a.t riseup.net>

ARG APP_VERSION="unknown"

ADD container-files/ /

#
# Install RKD
#
RUN apk add py3-pip bash git \
    && apk add --virtual .DEPS gcc g++ musl-dev python3-dev libffi-dev openssl-dev \
    && pip3 install -r /opt/rkd/requirements.txt \
    && apk del .DEPS

#
# Clone a proper version of Taiga Events
#
RUN cd /opt \
    && git clone https://github.com/taigaio/taiga-events.git \
    && cd /opt/taiga-events \
    && git checkout "${APP_VERSION}" \
    && chown node:node /opt/taiga-events -R \
    && npm install -g coffeescript

#
# Install
#
USER node
RUN cd /opt/taiga-events \
    && npm install

USER root
RUN chmod +x /entrypoint.sh

USER node
ENTRYPOINT ["/entrypoint.sh"]
