FROM alpine:3.16

RUN apk update && apk add --no-cache procps bash tar

ARG CSVTK_VERSION=0.24.0

WORKDIR /app

ADD https://github.com/shenwei356/csvtk/releases/download/v${CSVTK_VERSION}/csvtk_linux_amd64.tar.gz csvtk_linux_amd64.tar.gz

RUN tar xzf csvtk_linux_amd64.tar.gz && mv csvtk /usr/local/bin/ && rm csvtk_linux_amd64.tar.gz

RUN adduser -DH app && chown -R app /app

USER app