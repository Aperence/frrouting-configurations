# SRv6 lab

Suppose we want to change the shortest path used to reach R5 from R1, and instead use the path R1->R4->R5

## To use inline

We can simply use the END segments defined by IS-IS, and add an inline segment to it. Note that this technique only works with IPv6 packets, for obvious reason (we can't inline on an IPv4 packet). Thus we must add a rule on some intermediary router:

```
ip -6 route add fc00::5/128 encap seg6 mode inline segs fc00:4:: dev sr0
```

You can then encapsulate the packet on R2 using 
```
ip -6 route add fc00::5/128 encap seg6 mode inline segs fc00:4:: dev sr0
```

## To use encap

We must define new segments END.DX4/END.DX6 depending on the type of the inner packet : for example:

For IPv4 inner packet :
```
ip -6 route add fc00:4:a:: encap seg6local action End.DX4 nh4 0.0.0.0 dev sr0
```

For IPv6 inner packet :
```
ip -6 route add fc00:4:b:: encap seg6local action End.DX6 nh6 :: dev sr0
```

Then we can encap on any router (typically use R2 for simplicity) using:

For IPv4 packets:

```
ip route add 10.0.0.5/32 encap seg6 mode encap segs fc00:4:a:: dev sr0
```

For IPv6 packets:

```
ip -6 route add fc00::5/128 encap seg6 mode encap segs fc00:4:b:: dev sr0
```