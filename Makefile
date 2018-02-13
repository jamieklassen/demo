build_containers: build_app
	cp app/target/*.war infra/tomcat
	cp -r config infra/chef-server/
	rm -rf app/target
	cp -r app infra/jenkins/
	docker-compose -f infra/docker-compose.yml build
start_containers:
	docker-compose -f infra/docker-compose.yml up -d
	docker exec -it infra_sit_1 service tomcat7 start
	docker exec -it infra_uat_1 service tomcat7 start
	docker exec -it infra_prod_1 service tomcat7 start
setup_db_urls:
	docker exec -it infra_sit_1 bash -c "while [ ! -d /var/lib/tomcat7/webapps/ROOT/WEB-INF/classes ]; do sleep 1; done"
	docker exec -it infra_sit_1 bash -c "echo 'spring.datasource.url=jdbc:postgresql://sit_db:5432/data' >> /var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/application.properties && service tomcat7 restart"
	docker exec -it infra_uat_1 bash -c "echo 'spring.datasource.url=jdbc:postgresql://uat_db:5432/data' >> /var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/application.properties && service tomcat7 restart"
	docker exec -it infra_prod_1 bash -c "echo 'spring.datasource.url=jdbc:postgresql://prod_db:5432/data' >> /var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/application.properties && service tomcat7 restart"
build_app:
	if [ -f infra/tomcat/demo-0.0.1-SNAPSHOT.war ]; then \
	echo "app already built"; \
	else \
	pushd app && ./mvnw package -Dmaven.test.skip=true && popd; \
	fi
git_init:
	infra/git_init.sh app
	infra/git_init.sh config
up: build_app start_containers git_init setup_db_urls
down:
	docker-compose -f infra/docker-compose.yml down
clean:
	rm -rf app/.git config/.git infra/tomcat/*.war
	pushd app && ./mvnw clean && popd
restart: down up
rebuild: down clean build_app build_containers start_containers git_init setup_db_urls
