ARG PYTHON_VERSION=3.10

FROM python:${PYTHON_VERSION}-alpine

RUN apk update && apk add --no-cache procps bash

WORKDIR /app

RUN adduser -DH app && chown -R app /app

USER app