#!/bin/bash

# Spawn a listener and output connection attempts to log
listener()
{
 port=$1
 while true
 do
  nc -lv $port 2>&1 | ts '[%y-%m-%d %H:%M:%S]' | awk -v var="$port" '/Connection/{print $0" to Port " var ;}' >> /logs_out/hp_connections.log
 done &
}

# Main
for p in {80,3306}; do
 listener $p
done

# Run foreground process to keep container up
tail -f /dev/null

