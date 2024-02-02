
# https://docs.openvswitch.org/en/latest/intro/install/distributions/#fedora
sudo dnf install openvswitch

sudo -i
cd /usr/bin
wget https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
chmod a+rwx ovs-docker