
lab_name="clab-vpn-lab"

pe_routers_number=4
for i in $(seq $pe_routers_number); do
    for j in $(seq $pe_routers_number); do
        loss=$(docker exec $lab_name-pe$i sh -c "ping -i 0.05 -c 10 fc00::$j" | grep "packet loss" | cut -f7 -d" ")
        loss=${loss%\%}
        echo "Loss ratio for pe$i to pe$j : $loss %"
        if [ "$loss" -gt 20 ]; then
            # if more than 20% packet lost, consider the connectivity to be faulty
            echo "Connection faulty, test failed"
            exit 1
        fi
    done
done

number_ces=5
ces="ce1-1 ce1-2 ce2-1 ce2-2 ce1-3"
i=1
for ce in $ces; do
    for j in $(seq $number_ces); do
        loss=$(docker exec $lab_name-$ce sh -c "ping -i 0.05 -c 10 10.$j.0.1 -I 10.$i.0.1" | grep "packet loss" | cut -f7 -d" ")
        loss=${loss%\%}
        echo "Loss ratio for $ce to 10.$j.0.1 : $loss %"
        if [ "$loss" -gt 20 ]; then
            # if more than 20% packet lost, consider the connectivity to be faulty
            echo "Connection faulty, test failed"
            exit 1
        fi
    done
    i=$(($i + 1))
done