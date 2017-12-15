#!/bin/bash
# A script that installs Java on Ubuntu.

set -e

sudo apt-get update
sudo apt-get install -y default-jre
java -version
