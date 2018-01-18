up:
	docker-compose build
	docker-compose up -d
	./git_init.sh app
	./git_init.sh config
	./first_build.sh
down:
	docker-compose down
	rm -rf ../app/.git ../config/.git
restart: down up
