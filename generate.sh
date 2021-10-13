#!/bin/bash

REMOTE_IP=$1
CLIENT_LOCAL=$2
SERVER_LOCAL=$3

apt-get update
apt-get install -y openvpn

cat <<EOF >client.ovpn
remote $REMOTE_IP
dev tun
ifconfig $CLIENT_LOCAL $SERVER_LOCAL
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

cp client.ovpn /etc/openvpn/client/client.ovpn
cp server.ovpn /etc/openvpn/server/server.ovpn
rm -rf {client,server}.ovpn