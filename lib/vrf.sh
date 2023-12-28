vrf_name=$1
table_id=$2
itf=$3

# create a vrf
echo "Adding vrf $vrf_name"
ip link add $vrf_name type vrf table $table_id
ip link set dev $vrf_name up

# setting a dummy interface for this vrf
ip link add vrfDummy type dummy
ip link set vrfDummy up
ip addr add 10.255.255.2 dev vrfDummy
ip link set dev vrfDummy master $vrf_name

# adding the interface toward this CE to the vrf
ip link set dev $itf master $vrf_name