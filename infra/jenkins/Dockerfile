FROM jenkins/jenkins:lts
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false 
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY jenkins.plugins.slack.SlackNotifier.xml /var/jenkins_home/jenkins.plugins.slack.SlackNotifier.xml
COPY jenkins.model.JenkinsLocationConfiguration.xml /var/jenkins_home/jenkins.model.JenkinsLocationConfiguration.xml
COPY hudson.plugins.sonar.SonarGlobalConfiguration.xml /var/jenkins_home/hudson.plugins.sonar.SonarGlobalConfiguration.xml
COPY validator.pem /etc/chef/client.pem
USER jenkins
COPY app_config.xml /var/jenkins_home/app_config.xml
COPY app_config.groovy /var/jenkins_home/init.groovy.d/app_config.groovy
COPY config_config.xml /var/jenkins_home/config_config.xml
COPY config_config.groovy /var/jenkins_home/init.groovy.d/config_config.groovy
COPY knife.rb /var/jenkins_home/.chef/knife.rb
COPY validator.pem /var/jenkins_home/.chef/.pem
USER root
COPY app /tmp/app
RUN cd /tmp/app && ./mvnw package
RUN curl -L https://omnitruck.chef.io/install.sh | bash
