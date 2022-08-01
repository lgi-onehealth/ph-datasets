FROM python:3.10.5-slim-bullseye

RUN apt update -y && apt install -y curl

RUN pip --no-cache-dir install ffq==0.2.1

WORKDIR /runfolder

RUN adduser runner && chown -R runner /runfolder

USER runner
