isisd -d
zebra -d
bgpd -d
vtysh -f conf.txt
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1

# SRv6 
ip link add sr0 type dummy
ip link set sr0 up
sysctl net.ipv6.conf.all.seg6_enabled=1

for itf in $(ls /sys/class/net); do
    sysctl net.ipv6.conf.$itf.seg6_enabled=1
done

# Adding the encapsulation
# ip route add 10.255.0.1/32 encap seg6 mode encap segs fc00:1:a:: dev sr0
# ip route add 10.255.0.3/32 encap seg6 mode encap segs fc00:3:a:: dev sr0
# ip route add 10.255.0.4/32 encap seg6 mode encap segs fc00:4:a:: dev sr0
# ip route add 10.255.0.10/32 encap seg6 mode encap segs fc00:10:a:: dev sr0
# ip route add 10.255.0.20/32 encap seg6 mode encap segs fc00:20:a:: dev sr0

# ip -6 route add fc00:2:a:: encap seg6local action End.DX4 nh4 0.0.0.0 dev sr0
