
## Join a group on a host

```
smcroute -d
smcroute -j eth1 237.0.0.10
```

## Prevent host from sending multicast packets

On router 4, we can prevent receiver 1 from sending multicast packets by using :

```
iptables -i host -A INPUT -s HOST_ADRESS -d GROUP_ADRESS -j DROP
```

## Send multicast packets

**IMPORTANT**: You must set the TTL to a high-enough value manually, e.g. 10 for our network. By default, multicast packets are sent with ttl=1 to avoid broadcasts in badly configured networks.

s1:/# ping -t10 237.0.0.10