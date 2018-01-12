tmpdir := /tmp/app
up:
	rm -rf $(tmpdir)
	mkdir -p $(tmpdir)
	git -C $(tmpdir) init
	cp -r ../app/* $(tmpdir)/
	git -C $(tmpdir) add $(tmpdir)
	git -C $(tmpdir) ci -m 'initial commit'
	GIT_DIR=$(tmpdir) docker-compose up -d
down:
	docker-compose down
