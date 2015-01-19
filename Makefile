ifndef ARCH
	ARCH=armhf
endif

init:
	@./fetch.sh init

update:
	@./fetch.sh update

build:
	@echo "Get latest docker image"
	@docker pull sanji/python-dev:$(ARCH)
	@echo "Build bundles dependencies into *.whl package"
	@docker run --rm -v `pwd`:/data sanji/python-dev:$(ARCH)

.PHONY: init update build
