ARG NODE_VERSION=12.16.3
ARG ALPINE_VERSION=3.11

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}
MAINTAINER RiotKit <riotkit a.t riseup.net>

ARG APP_VERSION="unknown"

ENV BACKEND_SECRET="" \
    AMQP_URL=""

ADD container-files/ /

#
# Install RKD
#
ENV RKD_PATH=/opt/rkd/.rkd
RUN apk add py3-pip bash git \
    && pip3 install -r /opt/rkd/requirements.txt

#
# Clone a proper version of Taiga Events
#
RUN cd /opt \
    && git clone https://github.com/taigaio/taiga-events.git \
    && cd /opt/taiga-events \
    && git checkout "${APP_VERSION}" \
    && chown node:node /opt -R \
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
EXPOSE 8888
ENTRYPOINT ["/entrypoint.sh"]
