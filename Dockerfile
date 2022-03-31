FROM alpine:3.14

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    bash \
    curl-dev \
    ruby-dev \
    build-base \
    git \
    ruby \
    ruby-irb \
    ruby-io-console \
    ruby-rdoc \
    ruby-bundler \
    mariadb-dev

RUN apk add --update \
            udev \
            ttf-freefont \
            chromium \
            openssl \
            chromium-chromedriver \
            gfortran \
            gcc \
            g++

WORKDIR /root/src

CMD ["top"]
