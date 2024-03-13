APP_NAME = "normKitchen"

.PHONY: tailwind-install, tailwind-build, tailwind-watch
tailwind-install:
	curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
	chmod +x tailwindcss-linux-x64
	mv tailwindcss-linux-x64 tailwindcss
	./tailwindcss init
tailwind-build:
	./tailwindcss -i ./static/css/input.css -o ./static/css/style.css --minify
tailwind-watch:
	./tailwindcss -i ./static/css/input.css -o ./static/css/style.css --watch


.PHONY: templ-generate, templ-watch
templ-generate:
	templ generate
templ-watch:
	templ generate --watch

.PHONY: run, dev, build
run:
	go run ./cmd/main.go
dev:
	go build -o ./tmp/$(APP_NAME) ./cmd/$(APP_NAME)/main.go && air
build:
	make tailwind-build && make templ-generate && go build -o ./bin/$(APP_NAME) ./cmd/$(APP_NAME)/main.go
