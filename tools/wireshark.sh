#!/bin/sh
lab_name=vpn-lab

name=$1
itf=$2
docker exec clab-$lab_name-$name sh -c "tcpdump -U -nni $itf -w -" | wireshark -k -i -
