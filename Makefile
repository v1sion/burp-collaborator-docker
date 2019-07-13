IMAGE_NAME := burp-collaborator
CONTAINER_NAME := burp-collaborator
DOCKER_REGISTRY := v1sion
VERSION := 0.1.$(TRAVIS_BUILD_NUMBER)

SHELL=bash

.PHONY: build test tag clean publish push run stop version
.EXPORT_ALL_VARIABLES: true

version:
	@echo $(VERSION)

build:
	@echo "build: ***Building $(IMAGE_NAME)***"	
	docker build -t $(IMAGE_NAME) . --build-arg DOMAIN=$(DOMAIN) --build-arg NS=$(NS) --build-arg IP=$(IP)

stop:
	docker stop $(CONTAINER_NAME)

run:
	@echo "run: ***Running $(IMAGE_NAME)***"
	docker run --name $(CONTAINER_NAME) -d -p 53:3353 -p 53:3353/udp -p 80:3380 -p 443:33443 -p 25:3325 -p 587:33587 -p 465:33465 -p 9090:39090 -p 9443:39443 $(IMAGE_NAME)
	docker ps

test: build
	@echo "test: ***Testing $(IMAGE_NAME)***"

tag:
	@echo "***Tagging $(IMAGE_NAME) $(VERSION)***"
	docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(IMAGE_NAME)
	docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(VERSION)
	docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(IMAGE_NAME):latest
	@echo "***Tagging git $(VERSION)***"
	git tag v$(VERSION)

push:
	@echo "***Pushing git tags***"
	git push --tags
	@echo "push: $(DOCKER_REGISTRY)/$(IMAGE_NAME)"
	docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(VERSION)
	docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):latest

publish: tag push
	@echo "publish: ***Publishing images***"

clean:
	@echo "clean: ***Cleaning container***"
	docker rm -f $(CONTAINER_NAME)
	docker rmi -f $(IMAGE_NAME)
