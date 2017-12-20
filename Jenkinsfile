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
        sh 'juju register MGUTB2plbmtpbnMwKBMSMzQuMjAxLjEzLjQwOjE3MDcwExIxNzIuMzEuNzAuNTg6MTcwNzAEILSz3DR3kND4EDM5YqQx4q4phh_Edn6Tp-6zHyMbJghpEw5hZ2lsZS1jb2UtZGVtbwAA'
        sh 'juju scp target/*.war tomcat/0:'
        sh 'juju ssh tomcat/0 "sudo mv *.war /var/lib/tomcat7/webapps/"'
      }
    }
  }
}
