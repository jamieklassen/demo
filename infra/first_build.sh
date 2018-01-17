#!/bin/bash

false
while [ "$?" != "0" ]; do
  sleep 1
  curl -f localhost:8080/job/config/build
done
