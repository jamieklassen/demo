up:
	docker-compose -f infra/docker-compose.yml build
	docker-compose -f infra/docker-compose.yml up -d
	infra/git_init.sh app
	infra/git_init.sh config
	infra/first_build.sh
down:
	docker-compose -f infra/docker-compose.yml down
	rm -rf app/.git config/.git
restart: down up
