.DEFAULT_GOAL := build

node-v10.15.1-linux-x64.tar.xz:
	@curl -LO https://nodejs.org/dist/v10.15.1/node-v10.15.1-linux-x64.tar.xz

go1.11.5.linux-amd64.tar.gz:
	@curl -LO https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz


deps: node-v10.15.1-linux-x64.tar.xz go1.11.5.linux-amd64.tar.gz

build: deps
	@docker build -t obliquo/trickster .

push: build
	@docker push obliquo/trickster
