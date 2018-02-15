FROM rastasheep/ubuntu-sshd:14.04
RUN apt-get update && apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:openjdk-r/ppa && \
  apt-get update && apt-get install -y openjdk-8-jdk tomcat7 tomcat7-admin curl && \
  curl -L https://omnitruck.chef.io/install.sh | bash && \
  rm -rf /var/lib/tomcat7/webapps/ROOT && \
  echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/default/tomcat7
COPY *.war /var/lib/tomcat7/webapps/ROOT.war
