# Point-to-point VPN for Starlink

Bidirectionnal point-to-point VPN configuration for SpaceX Starlink using OpenVPN. The tunnel is **unencrypted** !

## Requirements

- Linux system
- OpenVPN version >=2.4

Only tested under ubuntu 18.04, 20.04 and 22.04 

## Installation

On both client and server, launch the command: `sudo bash generate.sh <REMOTE_IP> <CLIENT_LOCAL> <SERVER_LOCAL>`

## Run the VPN

On the server run: `sudo bash server.sh`

On the client run: `sudo bash client.sh`

## Test the VPN

If the VPN is successfuly established, new TUN interaces should show up when running `ip a` with the VPN configuration.

Also, you must be able to ping the client from the server and also the server from the client.

If not, check the `/var/log/openvpn.log` file for more informations.
