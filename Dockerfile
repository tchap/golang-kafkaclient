FROM golang:1.8.3-alpine3.5

ARG LIBRESSL_VERSION=2.5
ARG LIBRDKAFKA_VERSION=0.11.0-r0

RUN apk add libressl${LIBRESSL_VERSION}-libcrypto libressl${LIBRESSL_VERSION}-libssl --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main && \
	apk add make \
	  pkgconfig \
	  bash \
	  gcc \
	  libc-dev \ 
	  git && \
\
    apk add librdkafka=${LIBRDKAFKA_VERSION} librdkafka-dev=${LIBRDKAFKA_VERSION} --update-cache --repository http://nl.alpinelinux.org/alpine/edge/community
