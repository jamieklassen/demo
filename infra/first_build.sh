#!/bin/bash

false
while [ "$?" != "0" ]; do
  echo "waiting for jenkins..."
  sleep 1
  curl -f localhost:8080/job/config/build >/dev/null 2>&1
done
