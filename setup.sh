isisd -d
zebra -d
bgpd -d
vtysh -f conf.txt
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1
sysctl net.mpls.platform_labels=100000
sysctl net.mpls.conf.eth1.input=1
sysctl net.mpls.conf.eth2.input=1
if [ -n "$(ip addr | grep eth3)" ]; then
    sysctl net.mpls.conf.eth3.input=1
fi
if [ -n "$(ip addr | grep eth4)" ]; then
    sysctl net.mpls.conf.eth4.input=1
fi
if [ -n "$(ip addr | grep eth5)" ]; then
    sysctl net.mpls.conf.eth5.input=1
fi
