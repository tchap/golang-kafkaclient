FROM golang:1.7

ENV KAFKACAT /opt/kafkacat

RUN apt-get update && apt-get -y install librdkafka-dev libyajl-dev && mkdir $KAFKACAT && git clone https://github.com/edenhill/kafkacat.git $KAFKACAT && cd $KAFKACAT && ./configure && make && make install && rm -rf /var/lib/apt/lists/*
