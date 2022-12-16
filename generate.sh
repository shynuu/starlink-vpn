#!/bin/bash

REMOTE_IP=$1
CLIENT_LOCAL=$2
SERVER_LOCAL=$3

apt-get update
apt-get install -y openvpn

cat <<EOF >client.ovpn
remote $REMOTE_IP 1194 udp
dev tun
ifconfig $CLIENT_LOCAL $SERVER_LOCAL
proto udp4
port 1194
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
ncp-disable
user nobody
group nogroup
daemon
verb 3
log-append /var/log/openvpn.log
EOF

cat <<EOF >server.ovpn
dev tun
ifconfig $SERVER_LOCAL $CLIENT_LOCAL
local $REMOTE_IP
proto udp4
port 1194
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
ncp-disable
user nobody
group nogroup
daemon
verb 3
log-append /var/log/openvpn.log
EOF

mv client.ovpn /etc/openvpn/client/client.ovpn
mv server.ovpn /etc/openvpn/server/server.ovpn
