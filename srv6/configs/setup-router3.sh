# Create SRv6 interface
ip link add sr0 type dummy
ip link set sr0 up

# IP forwarding
sysctl net.ipv4.ip_forward=1
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1

# Enabling SRv6
sysctl net.ipv6.conf.eth1.seg6_enabled=1
sysctl net.ipv6.conf.eth2.seg6_enabled=1
sysctl net.ipv6.conf.eth3.seg6_enabled=1
sysctl net.ipv6.conf.all.seg6_enabled=1

# Adding delays
tc qdisc add dev eth1 parent root netem delay 5ms
tc qdisc add dev eth2 parent root netem delay 5ms
tc qdisc add dev eth3 parent root netem delay 5ms

# Add the segments for decapsulating encapsulated packets, and forward it accordingly
ip -6 route add fc00:3:a:: encap seg6local action End.DX4 nh4 0.0.0.0 dev sr0
ip -6 route add fc00:3:b:: encap seg6local action End.DX6 nh6 :: dev sr0

# Launching FRR daemons
zebra -d
isisd -d

vtysh -f conf.txt