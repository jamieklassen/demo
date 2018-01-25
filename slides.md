# Conventional EDF Delivery

1. Check in code changes
1. Schedule build
1. Schedule DIT deploy
1. Validate code is working in DIT; dev lead signs off on SIT deploy
1. Schedule SIT deploy
1. QA potentially waits for data to be loaded in dependent systems
1. QA runs test cases
1. QA signs off on UAT deploy
1. Schedule UAT deploy
1. QA and business perform acceptance testing
1. QA and business sign off on production deploy
1. Gating
1. Security
1. Audit
1. CAB meeting
1. ...
1. Production deploy

---
# Time Consumed

1. Check in code changes
1. Schedule build **days**
1. Schedule DIT deploy **days**
1. Validate code is working in DIT; dev lead signs off on SIT deploy
1. Schedule SIT deploy **days**
1. QA potentially waits for data to be loaded in dependent systems **days**
1. QA runs test cases **days**
1. QA signs off on UAT deploy
1. Schedule UAT deploy **days**
1. QA and business perform acceptance testing **days**
1. QA and business sign off on production deploy
1. Gating **days**
1. Security **days**
1. Audit **days**
1. CAB meeting **a day**
1. ...
1. Production deploy

---

# Automated Delivery

- pre-approved scripts instead of scheduled manual builds and deploys
- pre-approved test suites instead of manual QA tasks and signoffs
    - don't be afraid: you can still have manual signoffs on every single build
- version control as a single source of truth
- steps orchestrated in a pipeline
```groovy
pipeline {
  stages {
    stage('Build & Test') {
      steps {
        sh './mvnw clean package'
      }
    }
    ...
    stage('UAT Deploy') {
      ...
    }
    stage('Prod Deploy') {
      ...
    }
  }
}
```

---

# Time Consumed

1. Check in code changes
1. Schedule build **minutes**
1. pipeline automatically triggers SIT deploy **seconds**
1. pipeline runs test cases **seconds**
1. pipeline automatically triggers UAT deploy **seconds**
1. pipeline performs automated acceptance tests **seconds**
1. pipeline automatically triggers production deploy **seconds**

---

# Code

why two repositories? who is responsible for what?
## [App - Spring Boot Web Service](http://localhost:10080/username/app)
## [Config - Chef Repository](http://localhost:10080/username/config)

---

# Demo Deploy

[Config Pipeline](http://localhost:8080/blue/organizations/jenkins/config/detail/config/1/pipeline/)

[New Build](http://localhost:8080/job/app/build)

[App Pipeline](http://localhost:8080/blue/organizations/jenkins/app/detail/app/1/pipeline)

---

# Environments

- [SIT](http://localhost:8081)
- [UAT](http://localhost:8082)
- [Production](http://localhost:8083)

---

# [Artifacts](http://localhost:9001/artifactory/webapp/#/artifacts/browse/tree/General/generic-local)
use artifactory for dependencies

---

# [Static Code Analysis](http://localhost:9000/dashboard?id=com.example%3Ademo)

---

# Demo Infrastructure

```bash
git clone \
  http://username:password@localhost:10080/username/config.git
```
i have infrastructure-as-code
- it's good because

i have an automation pipeline for IaC
- it's good because

some way to prove that i upgraded tomcat and the same apps are deployed?

---

# Demo Slack Ops

Add a failing test, watch the slack notification and pipeline go red
http://agilecoedemo.slack.com

---

# Demo Feature Change

```bash
git clone \
  http://username:password@localhost:10080/username/app.git
```

---

# [Demo Monitoring](http://localhost:3030/dashboard/db/jvm-overview-prometheus?refresh=30s&orgId=1)
