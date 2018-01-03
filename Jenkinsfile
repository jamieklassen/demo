pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
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
        sh '/Applications/SoapUI-5.4.0.app/Contents/java/app/bin/testrunner.sh demo-soapui.xml'
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
        sh '/Applications/SoapUI-5.4.0.app/Contents/java/app/bin/loadtestrunner.sh demo-soapui-loadtests.xml'
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
    success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
    failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
  }
}
