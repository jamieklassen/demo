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
        withCredentials([sshUserPrivateKey(credentialsId: '33c61780-84d6-49a7-a885-710658f38b2a', keyFileVariable: 'KEYFILE')]) {
          echo 'Deploying....'
          sh 'sudo sh -c "ssh-keyscan -H ec2-54-91-151-32.compute-1.amazonaws.com > /etc/ssh/known_hosts"'
          sh 'scp -i $KEYFILE target/*.war ubuntu@ec2-54-91-151-32.compute-1.amazonaws.com:~'
          sh 'ssh -i $KEYFILE ubuntu@ec2-54-91-151-32.compute-1.amazonaws.com "sudo mv *.war /var/lib/tomcat7/webapps/"'
        }
      }
    }
  }
}
