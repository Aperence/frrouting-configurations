isisd -d
zebra -d
bgpd -d
vtysh -f conf.txt
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1