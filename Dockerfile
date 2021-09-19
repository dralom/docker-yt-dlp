FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic

ENV TZ=UTC
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip \
    ffmpeg \
    phantomjs && \
    python3 -m pip install --upgrade yt-dlp && \
    mkdir /download && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

WORKDIR /download

ENTRYPOINT [ "yt-dlp" ]