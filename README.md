# Point-to-point VPN for Starlink

Point-to-point VPN for Starlink using OpenVPN. The tunnel is **unencrypted** !

## Requirements

Linux system

## Installation

On both client and server, launch the command: `sudo bash generate.sh <REMOTE_IP> <CLIENT_LOCAL> <SERVER_LOCAL>`

## Run the VPN

On the client run: `sudo bash client.sh`
On the server run: `sudo bash server.sh`