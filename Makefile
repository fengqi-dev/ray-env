.PHONY: build

build:
	docker build -t ray-env-builder -f Dockerfile .
	docker create --name tmp ray-env-builder
	docker cp tmp:/aladdin/ray-env.tar.gz .
	docker rm tmp