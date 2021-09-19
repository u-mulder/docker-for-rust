# Start rust container
.PHONY: up
up:
	@echo "==> Starting container with Rust"
	#@docker-compose up -d

# "start: is same as "up"
.PHONY: start
start: up

# Stop rust container
.PHONY: down
down:
	@echo "==> Stopping container with Rust"
	#@docker-compose stop

.PHONY: stop
stop: down

# Restart container with Rust
.PHONY: restart
restart: stop start

