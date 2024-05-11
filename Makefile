APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := ghcr.io/petebunin
VERSION=$(shell git describe --tags --abbrev=0 --tags)-$(shell git rev-parse --short HEAD)
TARGETOS=linux #linux darwin windows
TARGETARCH=amd64 #amd64 arm64 

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="https://github.com/PeterBunin/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}  --build-arg TARGETARCH=${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbotbot
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

linux:
	GOOS=linux GOARCH=amd64 go build -v -o kbot -ldflags "-X=github.com/PeterBunin/kbot/cmd.appVersion=${VERSION}"
