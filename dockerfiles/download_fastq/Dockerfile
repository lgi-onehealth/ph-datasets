FROM alpine:3.16

ARG CURL_VERSION=7.83.1-r2

RUN apk update && apk add --no-cache curl=${CURL_VERSION} procps bash

WORKDIR /app

RUN adduser -DH app && chown -R app /app

USER app