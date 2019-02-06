FROM alpine:3.5

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
    ruby-bundler
WORKDIR /root/src

CMD ["top"]
