#!/bin/bash

set -e

echo "Deploying tomcat..."
pushd $(dirname $0)/tomcat_server
  terraform apply
popd
echo "Clearing old Juju controller..."
juju destroy-controller --destroy-all-models aws-us-east-1
echo "Bootstrapping new Juju controller..."
juju bootstrap aws
echo "Deploying Jenkins..."
juju deploy jenkins --config $(dirname $0)/jenkins.yml
juju expose jenkins
juju debug-log & dlpid=$!
juju wait -m default 
kill -9 $dlpid
TOMCAT_DNS=$(aws ec2 describe-instances --filters Name=tag:Name,Values=tomcat | jq -r .Reservations[].Instances[].PublicDnsName)
echo "Recording Tomcat DNS in Jenkins known hosts..."
juju ssh jenkins/0 "sudo sh -c 'echo \"$TOMCAT_DNS\" > /etc/tomcat_dns'"
juju ssh jenkins/0 "sudo sh -c 'ssh-keyscan -H \"$TOMCAT_DNS\" > /etc/ssh/ssh_known_hosts'"
JENKINS_IP=$(juju ssh jenkins/0 'curl https://ifconfig.co/' | sed 's/[[:space:]]*//g')
CRUMB=$(curl -s "http://$JENKINS_IP:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)" -u admin:admin)
echo "Creating pipeline job..."
curl -s -X POST "http://$JENKINS_IP:8080/createItem?name=demo" -u admin:admin --data-binary @$(dirname $0)/job_config.xml -H "$CRUMB" -H "Content-Type:text/xml"
echo "Running first build..."
curl -X POST "http://$JENKINS_IP:8080/job/demo/build" -u admin:admin -H "$CRUMB"
curl -X POST "http://$JENKINS_IP:8080/job/demo/configSubmit" -u admin:admin -H "$CRUMB"
