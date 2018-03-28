# Sample Automated Delivery Pipeline

## Prerequisites
Docker-compose.

## Setup
Run `make up`.

## Hygieia
Check it out at `$DOCKER_HOST:3000`.

## Deployment environments
You will also have access to the following environments in which the sample app is deployed:

| Environment | Port (on docker host) |
| ----------- | --------------------- |
| Dev/SIT     | 8081                  |
| UAT         | 8082                  |
| Production  | 8083                  |

## Monitoring

TEMPORARILY DISABLED - but there should be a grafana dashboard at `$DOCKER_HOST:3030` showing JMX
data from prometheus. However, that prometheus image uses a volume by default and I can't easily mount
a directory on my laptop in a docker host in the cloud.

## Jenkins
You can access Jenkins at `http://$DOCKER_HOST:8085`

## Git
There is a gitlab server running. You can look at the repo at `http://$DOCKER_HOST:10080/root/app`.
In a workspace directory, run
`git clone http://oauth2:token@$DOCKER_HOST:10080/username/app.git`. Then if you make changes
and run `git push`, the Jenkins build will automatically be triggered.

## Sonarqube
It's at `$DOCKER_HOST:9000`

## Artifactory
It's at `$DOCKER_HOST:9001`

## Teardown
Run `make down`.
