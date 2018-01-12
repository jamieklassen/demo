# Sample Automated Delivery Pipeline

## Prerequisites
Virtualbox and Vagrant, plus
[vagrant-docker-compose](https://github.com/leighmcculloch/vagrant-docker-compose).

## Setup
In the `infra/` folder, run `vagrant up`. Then you can access Jenkins at
http://localhost:8080. The admin username is `admin` and password is `admin`. If you run
the `infrastructure` job once, you will then have access to the following environments in which the
sample app is deployed:

| Environment | URL                   |
| ----------- | --------------------- |
| Dev/SIT     | http://localhost:8081 |
| UAT         | http://localhost:8082 |
| Production  | http://localhost:8083 |

Furthermore, metrics for these instances should be visible at
http://localhost:3000/dashboard/db/jvm-overview-prometheus.
Note that this Jenkins is not set up to poll this repo at any particular interval, but you
can always trigger a build manually or via
`curl -u admin:admin "http://localhost:8080/git/notifyCommit?url=https://github.com/jamieklassen/demo"`

## Presentation Slides

Ensure you have remarker installed (say via `npm i -g remarker`), and run `npx remarker` in the
root of the repository. Slides should then be viewable at http://localhost:6275.
