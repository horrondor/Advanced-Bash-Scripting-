#!/bin/bash

# Does a 'whois domain-name' lookup on any of 3 aletrnate servers.
#  ripe.net, cw.net, radb.net
# Place this script --renamed 'wh' -- in /usr/local/bin

# Requires sysmbolic links:
# ln -s /usr/local/bin/wh /usr/local/bin/wh-ripe
# ln -s /usr/local/bin/wh /usr/local/bin/wh-apnic
# ln -s /usr/local/bin/wh /usr/local/bin/wh-tucows

E_NOARGS=75

if [ -z "$1" ]
then
  echo "Usage: $(basename "$0") [doamin-name]"
fi

# Check script name and call proper servers
case `basename $0` in # Or: case ${0##*/} in
    "wh"       ) whois $1@whois.tucows.com;;
    "wh-ripe"  ) whois $1@whois.ripe.net;;
    "wh-apnic" ) whois $1@whois.apnic.net;;
    "wh-cw"    ) whois $1@whois.cw.net;;
    *          ) echo "usage: $(basename "$0") [domain-name]";;
esac

exit $?