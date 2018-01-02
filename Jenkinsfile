pipeline {
  agent any
  stages {
    stage('Build & Test') {
      steps {
        echo 'Building..'
        sh './mvnw clean package'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying....'
        sh 'cp target/*.war ~/sit/'
      }
    }
    stage('SIT Tests') {
      steps {
        echo 'Running SoapUI tests...'
        sh '/Applications/SoapUI-5.4.0.app/Contents/java/app/bin/testrunner.sh REST-Project-1-soapui-project.xml'
      }
    }
  }
}
