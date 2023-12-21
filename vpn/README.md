# Creating a VPN using FRRouting

## Steps

- Adding Link-State routing [(IS-IS)](./01-configs-isis/)
- Adding [BGP](./02-configs-bgp/) for connectivity with other clients 
- Adding a [route reflector](./03-configs-rr/) for scalability
- Adding [segment routing](./04-configs-sr/) for the P routers
- Adding [SRv6](./04b-configs-srv6/) for the P routers (Currently not working)
- Adding [VPN layer](./configs/) (Currently still no way to exchange routes with RT between routers)