# Variables
CONTAINER_NAME=rust
RUST_APP_PATH=./rust-app

# Start rust container
.PHONY: up
up:
	@echo "==> Starting container with Rust"
	@docker-compose up -d

# "start: is same as "up"
.PHONY: start
start: up

# Stop rust container
.PHONY: down
down:
	@echo "==> Stopping container with Rust"
	@docker-compose stop

.PHONY: stop
stop: down

# Restart container with Rust
.PHONY: restart
restart: stop start

# Working with cargo

.PHONY: cargohelp
cargohelp:
	@echo "==> See cargo help"
	@docker-compose run --rm $(CONTAINER_NAME) cargo help

.PHONY: initapp
initapp:
	@echo "==> Init project with cargo"
	@docker-compose run --rm $(CONTAINER_NAME) cargo init .
	@rm $(RUST_APP_PATH)/.gitkeep -f

.PHONY: runapp
runapp:
	@echo "==> Building project with cargo"
	@docker-compose run --rm $(CONTAINER_NAME) cargo run .

.PHONY: rmdockergit
rmdockergit:
	@echo "==> Removing .git folder from docker"
	@rm -rf ./.git

# Add your custom recipes here
-include local.mk