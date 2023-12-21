# Creating a VPN using FRRouting

## Steps

- Adding Link-State routing [(IS-IS)](./01-configs-isis/)
- Adding [BGP](./02-configs-bgp/) for connectivity with other clients 
- Adding a [route reflector](./03-configs-rr/) for scalability
- Adding [segment routing](./04-configs-sr/) for the P routers
- Adding [SRv6](./04b-configs-srv6/) for the P routers (Currently not working)

Import vrf => BGP doesn't seem to have access to the default VRF, resulting in a failure to create a connection between peers