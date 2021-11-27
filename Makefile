

all: test build

test:

build: build-linux build-darwin-arm build-darwin build-win

build-linux:
	GOOS=linux GOARCH=amd64 go build \
		-o bin/Spellbook-linux cmd/cli/main.go

build-darwin-arm:
	GOOS=darwin GOARCH=arm64 go build \
		-o bin/Spellbook-darwin-arm cmd/cli/main.go

build-darwin:
	GOOS=darwin GOARCH=amd64 go build \
		-o bin/Spellbook-darwin cmd/cli/main.go

build-win:
	CGO_ENABLED=1 GOOS=windows GOARCH=amd64 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++ go build \
		-o bin/Spellbook-win cmd/cli/main.go

