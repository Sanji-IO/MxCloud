init:
	@./scripts/fetch.sh init

update:
	@./scripts/fetch.sh update

build:
	@./scripts/build.sh

install:
	@./scripts/install.sh install $(TARGET)

deploy:
	@./scripts/deploy.sh

.PHONY: init update build install deploy
