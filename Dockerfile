FROM alpine:3.12 AS builder
WORKDIR /opt
RUN apk add --update git build-base && \
    git clone https://github.com/google/jsonnet.git && \
    cd jsonnet && git checkout v0.15.0 && make && \
    cp jsonnet /usr/local/bin && \
    cp jsonnetfmt /usr/local/bin && \
    cd .. && rm -rf jsonnet

ENTRYPOINT ["/usr/local/bin/jsonnet"]
