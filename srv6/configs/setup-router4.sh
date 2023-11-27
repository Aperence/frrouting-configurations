zebra -d
isisd -d
sysctl net.ipv4.ip_forward=0
sysctl net.ipv4.conf.all.forwarding=0
sysctl net.ipv6.conf.all.forwarding=1
ip link add sr0 type dummy
ip link set sr0 up
tc qdisc add dev eth1 parent root netem delay 5ms
tc qdisc add dev eth2 parent root netem delay 5ms
tc qdisc add dev eth3 parent root netem delay 5ms
sysctl net.ipv6.conf.eth1.seg6_enabled=1
sysctl net.ipv6.conf.eth2.seg6_enabled=1
sysctl net.ipv6.conf.eth3.seg6_enabled=1
sysctl net.ipv6.conf.all.seg6_enabled=1
vtysh -f conf.txt