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
        sh 'cp -r /usr/local/share/juju ~/.local/share/'
        sh 'juju scp target/*.war tomcat/0:'
        sh 'juju ssh tomcat/0 "sudo mv *.war /var/lib/tomcat7/webapps/"'
      }
    }
  }
}
