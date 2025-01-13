#!/bin/ash

MAIN_IFACE=pppoe-wan
SECOND_IFACE=lan1

MAINNET=$(curl -s --interface $MAIN_IFACE "http://ip-api.com/json?fields=isp" | jq .isp)
SECONDNET=$(curl -s --interface $SECOND_IFACE "http://ip-api.com/json?fields=isp" | jq .isp)

echo $MAINNET
echo $SECONDNET
echo "NET1=$MAINNET" > /tmp/network_vars
echo "NET2=$SECONDNET" >> /tmp/network_vars