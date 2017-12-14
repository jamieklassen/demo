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
        echo 'TODO: A real implementation!'
      }
    }
  }
}
