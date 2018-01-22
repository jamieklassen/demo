# Sample Automated Delivery Pipeline

## Prerequisites
Docker-compose.

## Setup
In the `infra/` folder, run `make up`. Note that for links between Jenkins and Sonarqube to 
work properly, you will likely have to add a line like
```
127.0.0.1	sonarqube
```
to your `/etc/hosts` file (at least on Mac).

## Jenkins
You can access Jenkins at http://localhost:8080

## Deployment environments
You will also have access to the following environments in which the sample app is deployed:

| Environment | URL                   |
| ----------- | --------------------- |
| Dev/SIT     | http://localhost:8081 |
| UAT         | http://localhost:8082 |
| Production  | http://localhost:8083 |

## Git
There is a Gogs server running. You can look at the repo at http://localhost:10080/username/app.
In a workspace directory, run
`git clone http://username:password@localhost:10080/username/app.git`. Then if you make changes
and run `git push`, the Jenkins build will automatically be triggered.

## Slack
This jenkins is preconfigured to send slack messages to https://agilecoedemo.slack.com.

## Presentation Slides
Ensure you have remarker installed (say via `npm i -g remarker`), and run `npx remarker` in the
root of the repository. Slides should then be viewable at http://localhost:6275.

## Teardown
In the `infra/` folder, run `make down`.

## Architecture
The below diagram describes the various players in the demo:
![./sequence-diagram.svg](./sequence-diagram.svg)
