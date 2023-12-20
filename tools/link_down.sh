itf=$1
iptables -i $itf -A FORWARD -j DROP