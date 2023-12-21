## Test
Traceroute from ce1-1 to ce2-2
```
traceroute 10.4.0.1 -s 10.1.0.1
```
/!\ be careful to set the source, as otherwise it will use the address of some interface

## Show bgp routes
```
show bgp all
```

## Show bgp routes for ipv4

```
show bgp ipv4 
```

## Show bgp sessions

```
show bgp summary
```

## Show bgp vpn

```
show bgp ipv4 vpn 
```

## Careful RR

The command `neighbor PEER route-reflector-client` should be done in the RR server, not inside client