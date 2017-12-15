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
        sh 'git remote add heroku https://git.heroku.com/still-hamlet-39525.git'
        sh './mvnw heroku:deploy'
      }
    }
  }
}
