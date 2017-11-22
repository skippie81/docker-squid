#!/usr/bin/env bash

if [[ $1 == "squid" ]]
then
  # read the logpipe and print to stdout
  while read line
  do
    echo $line
  done < /var/log/squid/logpipe &

  echo starting squid proxy
  /usr/sbin/squid -N
fi

exec "$@"
