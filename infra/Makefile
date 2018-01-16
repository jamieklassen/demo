tmpdir := $(shell pwd)/gogs/tmp
up:
	mkdir -p $(tmpdir)
	git -C $(tmpdir) init
	./up.sh $(tmpdir)
	git -C $(tmpdir) add $(tmpdir)
	git -C $(tmpdir) ci -m 'initial commit'
	docker-compose build
	docker-compose up -d
	git -C $(tmpdir) remote add origin http://username:password@localhost:10080/username/app.git
	sleep 1
	git -C $(tmpdir) push origin master
	rm -rf $(tmpdir)
down:
	docker-compose down
	rm -rf $(tmpdir)
restart: down up
