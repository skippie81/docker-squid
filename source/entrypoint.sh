#!/usr/bin/env bash

if [[ $1 == "squid" ]]
then
  if [[ -f /var/run/squid.pid ]]
  then 
    rm /var/run/squid.pid
  fi
  chown -R proxy:proxy /cache
  chown proxy:proxy /var/log/squid/*
  # read the logpipe and print to stdout
  while read line
  do
    echo $line
  done < /var/log/squid/access.log &

  echo starting squid proxy
  /usr/sbin/squid -N
fi

exec "$@"
