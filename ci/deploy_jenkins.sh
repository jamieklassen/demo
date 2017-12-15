#!/bin/bash

set -e

juju deploy jenkins --config $(dirname $0)/jenkins.yml
juju expose jenkins
