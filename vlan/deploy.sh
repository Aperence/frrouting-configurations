
# Start hosts
docker run -tid --name host1 host
docker run -tid --name host2 host
docker run -tid --name host3 host
docker run -tid --name host4 host

# Creating the bridge
sudo ovs-vsctl add-br br0
sudo ifconfig br0 172.19.1.0 netmask 255.255.255.0 up

# Connect the ports (note that we must use a new eth itf on the containers)
sudo ovs-docker add-port br0 eth1 host1 --ipaddress=172.19.1.1/24
sudo ovs-docker add-port br0 eth1 host2 --ipaddress=172.19.1.2/24
sudo ovs-docker add-port br0 eth1 host3 --ipaddress=172.19.1.3/24
sudo ovs-docker add-port br0 eth1 host4 --ipaddress=172.19.1.4/24

# setting the vlans 
# can also be done with ovs-vsctl set port ITF tag=VLAN_ID
sudo ovs-docker set-vlan br0 eth1 host1 10
sudo ovs-docker set-vlan br0 eth1 host2 10
sudo ovs-docker set-vlan br0 eth1 host3 20
sudo ovs-docker set-vlan br0 eth1 host4 20