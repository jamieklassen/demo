stage 'Build & Test'

node {
  try {
    notifyBuild('STARTED')
    echo 'Building..'
    sh './mvnw clean package'
  } catch (e) {
    currentBuild.result = 'FAILED'
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

stage 'SIT Deploy'

node {
  try {
    notifyBuild('STARTED')
    echo 'Deploying....'
    sh 'cp target/*.war ~/sit/ROOT.war'
  } catch (e) {
    currentBuild.result = 'FAILED'
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

stage 'SIT Tests'

node {
  try {
    notifyBuild('STARTED')
    echo 'Running SoapUI functional tests...'
    sh '/Applications/SoapUI-5.4.0.app/Contents/java/app/bin/testrunner.sh demo-soapui.xml'
  } catch (e) {
    currentBuild.result = 'FAILED'
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

stage 'UAT Deploy'

node {
  try {
    notifyBuild('STARTED')
    echo 'Deploying....'
    sh 'cp target/*.war ~/uat/ROOT.war'
  } catch (e) {
    currentBuild.result = 'FAILED'
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

stage 'Load Tests'

node {
  try {
    notifyBuild('STARTED')
    echo 'Running SoapUI Load Tests...'
    sh '/Applications/SoapUI-5.4.0.app/Contents/java/app/bin/loadtestrunner.sh demo-soapui-loadtests.xml'
  } catch (e) {
    currentBuild.result = 'FAILED'
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

stage 'Prod Deploy'

node {
  try {
    notifyBuild('STARTED')
    echo 'Deploying....'
    sh 'cp target/*.war ~/prod/ROOT.war'
  } catch (e) {
    currentBuild.result = 'FAILED'
    throw e
  } finally {
    notifyBuild(currentBuild.result)
  }
}

def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'
 
  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def summary = "${subject} (${env.BUILD_URL})"
 
  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }
 
  // Send notifications
  slackSend (color: colorCode, message: summary)
}
