ifndef ARCH
	ARCH=armhf
endif

ifndef DEPLOY_DIR
	DEPLOY_DIR=/home/moxa/deploy.git
endif

ifndef SSHPASS
	SSHPASS=moxa
	SSHUSER=moxa
endif


init:
	@./scripts/fetch.sh init

update:
	@./scripts/fetch.sh update

build:
	@./scripts/build.sh
	@git add . && git commit -am "Build @ `date +'%Y.%m.%d %H:%M:%S'`"

install:
	@./scripts/install.sh install $(TARGET)

deploy:
	-@git remote remove $(TARGET)
	@git remote add $(TARGET) ssh://$(SSHUSER)@$(TARGET):$(DEPLOY_DIR)
	@sshpass -p $(SSHPASS) git push $(TARGET)

.PHONY: init update build install deploy
