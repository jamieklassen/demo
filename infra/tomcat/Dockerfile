FROM rastasheep/ubuntu-sshd:14.04
RUN apt-get update && apt-get install -y tomcat7 tomcat7-admin curl && \
  curl -L https://omnitruck.chef.io/install.sh | bash && \
  rm -rf /var/lib/tomcat7/webapps/ROOT
COPY *.war /var/lib/tomcat7/webapps/ROOT.war
