apt_update
apt_package 'tomcat7'
apt_package 'tomcat7-admin'
file '/etc/tomcat7/tomcat-users.xml' do
  content %{<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
  <role rolename="manager-script"/>
  <user username="admin" password="admin" roles="manager-script"/>
</tomcat-users>}
end
service 'tomcat7' do
  action :start
end
