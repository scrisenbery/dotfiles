#!/bin/sh
# Ignore if we're not on Debian
[[ -f /etc/debian_version ]]|| exit 0

apt-get update
apt-get upgrade

#apt-get install tree fail2ban vim snmpd iptables-persistent libssl-dev
#apt-get autoremove
