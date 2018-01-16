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
