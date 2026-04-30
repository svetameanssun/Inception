NAME = inception

# Colors
GREEN = \033[0;32m
BLUE = \033[0;34m
YELLOW = \033[0;33m
RED = \033[0;31m
NC = \033[0m

# Default target
all: up

# Start containers
up: hosts
	@mkdir -p /home/stitovsk/data/mariadb /home/stitovsk/data/wordpress
	@sudo chmod -R 777 /home/stitovsk/data
	@docker compose -f srcs/docker-compose.yml up --build -d

# Ensure /etc/hosts contains the necessary domain mapping
hosts:
	@echo "Checking /etc/hosts for domain..."
	@HOST_ENTRY="127.0.0.1	stitovsk.42.fr"; \
	if ! grep -q "$$HOST_ENTRY" /etc/hosts; then \
		echo "Adding $$HOST_ENTRY to /etc/hosts"; \
		echo "$$HOST_ENTRY" | sudo tee -a /etc/hosts > /dev/null; \
	else \
		echo "$$HOST_ENTRY already exists."; \
	fi

# Stop containers
down:
	@docker compose -f srcs/docker-compose.yml down
	@echo "Containers are stopped."

# Remove images only
clean: down
	@docker system prune -af
	@echo "Only images deleted."

# Full cleanup
fclean: down
	@docker system prune -af
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@sudo rm -rf /home/stitovsk/data
	@echo "All is cleaned!"

# Rebuild from scratch
re: fclean up

# Show status
ls:
	@echo "$(GREEN)CONTAINERS$(NC)"
	@docker ps -a
	@echo "-----"
	@echo "$(BLUE)IMAGES$(NC)"
	@docker images -a
	@echo "-----"
	@echo "$(YELLOW)VOLUMES$(NC)"
	@docker volume ls
	@echo "$(RED)NETWORKS$(NC)"
	@docker network ls

.PHONY: all up down clean fclean re hosts ls