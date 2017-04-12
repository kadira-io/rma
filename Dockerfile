# TODO use a stable version of alpine linux when
#      the mongodb package becomes available
#
# FROM alpine:3.2
#
# RUN \
#   apk upgrade --update && \
#   apk add --no-cache ca-certificates nodejs mongodb
#

FROM mhart/alpine-node:latest

RUN \
 echo 'http://dl-3.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
 apk upgrade --update && \
 apk add --no-cache ca-certificates nodejs mongodb

# Install bash
RUN apk add --update bash && rm -rf /var/cache/apk/*


WORKDIR /app

ADD ./package.json /app/
RUN npm install
ADD . /app

CMD [ "npm", "run", "start" ]
