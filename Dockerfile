FROM alpine:3.9 AS builder
RUN apk add --update git build-base
WORKDIR /opt
RUN git clone https://github.com/google/jsonnet.git
RUN cd jsonnet && git checkout v0.15.0 && make
RUN cp jsonnet/jsonnet /usr/local/bin
RUN cp jsonnet/jsonnetfmt /usr/local/bin

ENTRYPOINT ["/usr/local/bin/jsonnet"]
