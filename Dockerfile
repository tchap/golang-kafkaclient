FROM golang:1.8

ENV KAFKACAT_VERSION=1.3.0 KAFKACAT_PATH=/opt/kafkacat

COPY requirements.txt /tmp/

RUN apt-get update && apt-get -y install\
        librdkafka-dev libyajl-dev python-pip \
    && pip install -r /tmp/requirements.txt \
    && mkdir "$KAFKACAT_PATH" \
    && git clone -b "$KAFKACAT_VERSION" https://github.com/edenhill/kafkacat.git "$KAFKACAT_PATH" \
    && cd "$KAFKACAT_PATH" \
    && ./configure \
    && make && make install \
    && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* /var/tmp/* \
