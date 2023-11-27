# Creating a VPN using FRRouting

## Steps

- Adding Link-State routing [(IS-IS)](./configs-isis/)
- Adding [BGP](./configs-bgp/) for connectivity with other clients 
- Adding a [route reflector](./configs-rr/) for scalability
- Adding [segment routing](./configs-sr/) for the P routers

Import vrf => BGP doesn't seem to have access to the default VRF, resulting in a failure to create a connection between peers