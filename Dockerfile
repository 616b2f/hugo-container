FROM alpine:3.9 as build

RUN apk --update --no-cache add libstdc++ && \
    rm -rf /var/lib/apt/lists/* 
RUN wget -O arch.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.59.1/hugo_extended_0.59.1_Linux-64bit.tar.gz && \
    tar -xf arch.tar.gz -C /usr/local/bin/ hugo && \
    rm arch.tar.gz

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2