isisd -d
zebra -d
bgpd -d
vtysh -f conf.txt
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1

# MPLS
sysctl net.mpls.platform_labels=100000
sysctl net.mpls.conf.eth1.input=1
sysctl net.mpls.conf.eth2.input=1

# SRv6 
ip link add sr0 type dummy
ip link set sr0 up
sysctl net.ipv6.conf.all.seg6_enabled=1
sysctl net.ipv6.conf.eth1.seg6_enabled=1
sysctl net.ipv6.conf.eth2.seg6_enabled=1


if [ -n "$(ip addr | grep eth3)" ]; then
    sysctl net.mpls.conf.eth3.input=1
    sysctl net.ipv6.conf.eth3.seg6_enabled=1
fi
if [ -n "$(ip addr | grep eth4)" ]; then
    sysctl net.mpls.conf.eth4.input=1
    sysctl net.ipv6.conf.eth4.seg6_enabled=1
fi
if [ -n "$(ip addr | grep eth5)" ]; then
    sysctl net.mpls.conf.eth5.input=1
    sysctl net.ipv6.conf.eth5.seg6_enabled=1
fi
if [ "$(hostname)" == "pe1" ] || [ "$(hostname)" == "pe3" ] || [ "$(hostname)" == "pe4" ]; then
    printf "\033[0;34m"
    echo "Adding vrf Blue"
    ip link add Blue type vrf table 5
    ip link set dev Blue up
fi
if [ "$(hostname)" == "pe2" ] || [ "$(hostname)" == "pe4" ]; then
    printf "\033[0;31m"
    echo "Adding vrf Red"
    ip link add Red type vrf table 10
    ip link set dev Red up
fi
printf '\033[0m'
