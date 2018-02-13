directory '/var/lib/tomcat7/webapps/ROOT' do
  action :delete
  recursive true
end
remote_file '/var/lib/tomcat7/webapps/ROOT.war' do
  source 'http://admin:admin@artifactory:8081/artifactory/generic-local/app.war'
end
service 'tomcat7' do
  action :restart
end
ruby_block 'wait for tomcat' do
  block do
    true until ::File.exists?('/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/application.properties')
  end
end
