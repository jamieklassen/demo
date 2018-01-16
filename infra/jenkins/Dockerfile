FROM jenkins/jenkins:lts
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false 
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY jenkins.plugins.slack.SlackNotifier.xml /var/jenkins_home/jenkins.plugins.slack.SlackNotifier.xml
USER jenkins
COPY app_config.xml /var/jenkins_home/app_config.xml
COPY app_config.groovy /var/jenkins_home/init.groovy.d/app_config.groovy
