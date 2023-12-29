isisd -d
zebra -d
bgpd -d
vtysh -f conf.txt
sysctl net.ipv4.conf.all.forwarding=1
sysctl net.ipv6.conf.all.forwarding=1

# MPLS
sysctl net.mpls.platform_labels=100000

for itf in $(ls /sys/class/net); do
    sysctl net.mpls.conf.$itf.input=1
done

./frr-lib/vrf.sh Blue 5 eth1