# Sample Automated Delivery Pipeline
## Prerequisites
Virtualbox and Vagrant.
## Setup
In the root of this repository, run `vagrant up`. Then you can access Jenkins at
http://localhost:8080. The admin username is `admin` and password is `admin`. If you run
the `demo` job once, you will then have access to the following environments in which the
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
