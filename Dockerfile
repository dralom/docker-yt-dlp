FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && apt-get update 
RUN apt-get install -y ca-certificates 
RUN apt-get install -y build-essential 
RUN apt-get install -y chrpath 
RUN apt-get install -y libssl-dev 
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
ENV TZ=UTC
RUN apt-get install -y libxft-dev 
RUN apt-get install -y python3 
RUN apt-get install -y python3-pip 
RUN apt-get install -y wget
RUN apt-get install -y ffmpeg 
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install keyboard-configuration

RUN apt-get install -y phantomjs

RUN python3 -m pip install --upgrade yt-dlp

RUN mkdir /download

WORKDIR /download

ENTRYPOINT [ "yt-dlp" ]