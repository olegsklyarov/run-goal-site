DOCKER_IMAGE = dhcr.io/olegsklyarov/run-goal-site
DOCKER_CONTAINER_NAME = run-goal-site
DOCKER_NETWORK = infra_web_net

DOCKER_PLATFORM = linux/amd64

build:
	docker build --platform $(DOCKER_PLATFORM) -t $(DOCKER_IMAGE) .

push:
	docker push --platform $(DOCKER_PLATFORM) $(DOCKER_IMAGE)

run-local:
	docker run -it \
	-d \
	--restart=unless-stopped \
	--name $(DOCKER_CONTAINER_NAME) \
	-p 8080:80 \
	$(DOCKER_IMAGE)

run:
	docker run -it \
	-d \
	--restart=unless-stopped \
	--network=$(DOCKER_NETWORK) \
	--name $(DOCKER_CONTAINER_NAME) \
	$(DOCKER_IMAGE)

stop:
	docker stop $(DOCKER_CONTAINER_NAME) || true
	docker rm $(DOCKER_CONTAINER_NAME) || true
