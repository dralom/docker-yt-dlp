FROM ubuntu:latest

ENV TZ=UTC

ENV PUID=1000
ENV PGID=1000

# Install yt-dlp
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip \
    ffmpeg \
    phantomjs && \
    python3 -m pip install --upgrade yt-dlp 

# make it run as user 
RUN mkdir /download && \
    groupadd -g ${PGID} ytdlp && \
    useradd -u ${PUID} -g ${PGID} --no-create-home ytdlp && \
    chown -R ${PUID}:${PGID} /download && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

WORKDIR /download

USER ytdlp

ENTRYPOINT [ "yt-dlp" ]