#!/bin/bash

set -e

juju deploy jenkins --config $(dirname $0)/jenkins.yml
juju expose jenkins
juju wait -m default
juju ssh jenkins/0 'mkdir -p ~/.local/share'
juju scp -- -r ~/.local/share/juju jenkins/0:~/.local/share/
JENKINS_IP=$(juju ssh jenkins/0 'curl https://ifconfig.co/' | sed 's/[[:space:]]*//g')
CRUMB=$(curl -s "http://$JENKINS_IP:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)" -u admin:admin)
curl -s -XPOST "http://$JENKINS_IP:8080/createItem?name=demo" -u admin:admin --data-binary @$(dirname $0)/job_config.xml -H "$CRUMB" -H "Content-Type:text/xml"
