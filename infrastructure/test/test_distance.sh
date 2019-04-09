#!/usr/bin/env bash

while true; do
  if [ $(($RANDOM % 10)) == 0 ]; then
    echo "[ INFO ] Sending value that should be alerted"
    distance=90
  else
    distance=40
  fi
  echo "distance value=${distance}" | nc -w1 -u 192.168.1.44 8089
  sleep $1
done

