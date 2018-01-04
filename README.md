# Demo
## Prerequisites
Virtualbox and Vagrant.
## Setup
In the root of this repository, run
```
wget https://dl.dropboxusercontent.com/s/wid54y6l85bn21j/package.box
vagrant box add agile-coe-demo package.box
vagrant up
```
Then you can access Jenkins at http://localhost:8080. Username is `admin` and password
is `admin`. If you run the `demo` job once, you will then have access to the following
environments in which the sample app is deployed:

| Environment | URL                   |
| ----------- | --------------------- |
| Dev/SIT     | http://localhost:8081 |
| UAT         | http://localhost:8082 |
| Production  | http://localhost:8083 |
