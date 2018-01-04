pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }
    }
    stage('Build Gold Image') {
      steps {
        echo 'Building immutable infrastructure...'
        ansiColor('xterm') {
          sh 'packer build tomcat.json'
        }
      }
    }
    stage('Import Gold Image') {
      steps {
        echo 'Importing immutable infrastructure'
        sh 'cat target/tomcat.tar | docker import - custom-tomcat'
      }
    }
    stage('Provision Infrastructure') {
      steps {
        echo 'Provisioning tomcat servers...'
        sh 'docker-compose up -d'
      }
    }
    stage('Build & Test') {
      steps {
        echo 'Building..'
        sh './mvnw clean package'
      }
    }
    stage('SIT Deploy') {
      steps {
        echo 'Deploying....'
        sh 'cp target/*.war ~/sit/ROOT.war'
      }
    }
    stage('SIT Tests') {
      steps {
        echo 'Running SoapUI functional tests...'
        sh '~/SoapUI-5.4.0/bin/testrunner.sh -j demo-soapui.xml'
      }
    }
    stage('UAT Deploy') {
      steps {
        echo 'Deploying....'
        sh 'cp target/*.war ~/uat/ROOT.war'
      }
    }
    stage('Load Tests') {
      steps {
        echo 'Running SoapUI Load Tests...'
        sh '~/SoapUI-5.4.0/bin/loadtestrunner.sh -j demo-soapui-loadtests.xml'
      }
    }
    stage('Prod Deploy') {
      steps {
        echo 'Deploying....'
        sh 'cp target/*.war ~/prod/ROOT.war'
      }
    }
  }
  post {
    always {
      junit 'TEST*.xml'
    }
    success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
    failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
  }
}
