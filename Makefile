up: ## Run container
	docker-compose -f docker-compose.yml start
	docker-compose -f project-1/docker-compose.yml start
	docker-compose -f project-2/docker-compose.yml start
	docker-compose -f project-3/docker-compose.yml start

down: ## Stop container
	docker-compose -f docker-compose.yml stop
	docker-compose -f project-1/docker-compose.yml stop
	docker-compose -f project-2/docker-compose.yml stop
	docker-compose -f project-3/docker-compose.yml stop

