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
        withCredentials([sshUserPrivateKey(credentialsId: 'tomcat keypair', keyFileVariable: 'KEYFILE')]) {
          echo 'Deploying....'
          sh 'scp -i $KEYFILE target/*.war ubuntu@ec2-54-91-151-32.compute-1.amazonaws.com:~'
          sh 'ssh -i $KEYFILE ubuntu@ec2-54-91-151-32.compute-1.amazonaws.com "sudo mv *.war /var/lib/tomcat7/webapps/"'
        }
      }
    }
  }
}
