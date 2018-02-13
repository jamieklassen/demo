ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/application.properties")
    file.insert_line_if_no_match("postgresql", "spring.datasource.url=jdbc:postgresql://prod_db:5432/data")
    file.write_file
  end
end
service 'tomcat7' do
  action :restart
end
