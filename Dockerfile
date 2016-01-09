FROM node:latest

MAINTAINER Joshua Gardner <jgardner@izeni.com>

RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig \
    build-essential g++ flex bison gperf ruby perl \
    libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
    libpng-dev libjpeg-dev python libx11-dev libxext-dev

RUN mkdir /src && \
    cd /src && \
    git clone --recurse-submodules git://github.com/ariya/phantomjs.git && \
    cd phantomjs && \
    ./build.py && \
    install -m 755 -o root -g root -t /usr/local/bin bin/phantomjs

RUN mkdir /data

ADD ./package.json /data/package.json
RUN cd /data && npm install

ADD . /data/

CMD ["node", "/data/server.js"]

EXPOSE 3000
