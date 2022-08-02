FROM debian:bullseye-20220711-slim

WORKDIR /runfolder

ADD https://github.com/shenwei356/csvtk/releases/download/v0.24.0/csvtk_linux_amd64.tar.gz /runfolder/csvtk_linux_amd64.tar.gz

RUN tar xzf csvtk_linux_amd64.tar.gz && mv csvtk /usr/local/bin/ && rm csvtk_linux_amd64.tar.gz

RUN adduser runner && chown -R runner /runfolder

USER runner