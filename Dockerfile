FROM quay.io/frrouting/frr:9.1.0

RUN apk add tcpdump

COPY lib /frr-lib

RUN cd frr-lib/ && ls | xargs chmod +x