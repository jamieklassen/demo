pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
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
        sh '~/SoapUI-5.4.0/bin/testrunner.sh -e http://localhost:8081 -j demo-soapui.xml'
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
        sh '~/SoapUI-5.4.0/bin/loadtestrunner.sh -e http://localhost:8082 demo-soapui.xml'
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
      junit 'target/surefire-reports/*.xml'
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
