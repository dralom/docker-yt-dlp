FROM ubuntu

ENV TZ=UTC
ENV DEBIAN_FRONTEND="noninteractive"

# RUN apt-get update && apt-get upgrade -y && apt-get update 
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip \
    ffmpeg \
    phantomjs && \
    python3 -m pip install --upgrade yt-dlp && \
    mkdir /download && \
    groupmod -o -g 1000 ytdlp && \
    usermod -o -u 1000 ytdlp && \
    chown 1000:1000 /download && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

USER 1000:1000

VOLUME /download

ENTRYPOINT [ "yt-dlp" ]