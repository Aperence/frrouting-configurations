
for i in $(seq 4); do
    # delete the connected ports
    sudo ovs-docker del-ports br0 host$i

    # stop and remove container
    docker stop host$i > /dev/null
    docker rm host$i > /dev/null
    echo "Stopped host$i"
done

sudo ovs-vsctl del-br br0