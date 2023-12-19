zebra -d
isisd -d
pimd -d
sysctl net.ipv4.ip_forward=1
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1
tc qdisc add dev eth1 parent root netem delay 5ms
tc qdisc add dev eth2 parent root netem delay 5ms
tc qdisc add dev eth3 parent root netem delay 5ms
vtysh -f conf.txt