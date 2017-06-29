FROM golang:1.8

ENV KAFKACAT_VERSION=1.3.0 KAFKACAT_PATH=/opt/kafkacat

RUN apt-get update && apt-get -y install\
        librdkafka-dev libyajl-dev \
    && mkdir "$KAFKACAT_PATH" \
    && git clone -b "$KAFKACAT_VERSION" https://github.com/edenhill/kafkacat.git "$KAFKACAT_PATH" \
    && cd "$KAFKACAT_PATH" \
    && ./configure \
    && make && make install \
    && rm -rf /var/lib/apt/lists/* \
    && wget -qO - http://packages.confluent.io/deb/3.2/archive.key | apt-key add - \
    && echo "deb http://packages.confluent.io/deb/3.2 stable main" >> /etc/apt/sources.list \
    && apt-get update && apt-get -y install librdkafka-dev \

