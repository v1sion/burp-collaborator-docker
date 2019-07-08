IMAGE_NAME := burp-collaborator
CONTAINER_NAME := burp-collaborator

SHELL=bash

.PHONY: build build-no-cache clean clean-all run stop
.EXPORT_ALL_VARIABLES: true

build:
	@echo "build: ***Building $(IMAGE_NAME)***"
	sed -i'' -e "s/DOMAIN/$(DOMAIN)/g" config/burp.config
	sed -i'' -e "s/NS/$(NS)/g" config/burp.config
	sed -i'' -e "s/IP/$(IP)/g" config/burp.config
	docker build -t $(IMAGE_NAME) .

build-no-cache:
	@echo "build: ***Building $(IMAGE_NAME) with no cache***"
	sed -i'' -e "s/DOMAIN/$(DOMAIN)/g" config/burp.config
	sed -i'' -e "s/NS/$(NS)/g" config/burp.config
	sed -i'' -e "s/IP/$(IP)/g" config/burp.config
	docker build -t $(IMAGE_NAME) .

stop:
	docker stop $(CONTAINER_NAME)

run:
	@echo "run: ***Running $(IMAGE_NAME)***"
	docker run --name $(CONTAINER_NAME) -d -p 53:3353 -p 53:3353/udp -p 80:3380 -p 443:33443 -p 25:3325 -p 587:33587 -p 465:33465 -p 9090:39090 -p 9443:39443 $(IMAGE_NAME)
	docker ps

clean:
	@echo "clean: ***Cleaning container***"
	docker rm -f $(CONTAINER_NAME)

clean-all:
	@echo "clean: ***Cleaning container and images***"
	docker rm -f $(CONTAINER_NAME)
	docker rmi -f $(IMAGE_NAME)
